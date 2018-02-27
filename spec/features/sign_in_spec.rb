# frozen_string_literal: true

describe 'Sign in' do
  let!(:account) { create :account }

  it 'allows to sign in with email and password' do
    sign_in account
    expect(page).to have_content("Signed in as #{account.email}")
  end

  it 'blocks account when system detects too many sign in attempts' do
    expect {
      Devise.maximum_attempts.times { sign_in account, password: '11111111' }
    }.to change { ActionMailer::Base.deliveries.count }.by(1)
    expect(account.reload.locked_at?).to be_truthy
  end

end

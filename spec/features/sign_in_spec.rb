# frozen_string_literal: true

describe 'Sign in' do
  let!(:account) { create :account }

  it 'allows to sign in with email and password' do
    visit index_path
    click_on 'Sign in'
    fill_in 'Email', with: account.email
    fill_in 'Password', with: account.password
    click_on 'Submit'
    expect(page).to have_content("Signed in as #{account.email}.")
  end

  it 'blocks account when system detects too many sign in attempts' do
    visit index_path
    click_on 'Sign in'
    expect {
      Devise.maximum_attempts.times do
        fill_in 'Email', with: account.email
        fill_in 'Password', with: '11111111'
        click_on 'Submit'
      end
    }.to change { ActionMailer::Base.deliveries.count }.by(1)
    expect(page).to_not have_content(/account is locked/) # Devise paranoid mode.
    expect(account.reload.locked_at?).to be_truthy
  end

end

# frozen_string_literal: true

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
end

def sign_in(account, params = {})
  visit index_path
  fill_in 'account_email',    with: params[:email] || account.email
  fill_in 'account_password', with: params[:password] || account.password
  fill_in 'account_otp',      with: params[:otp] || '111111'
  click_on 'Submit'
end


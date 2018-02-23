# frozen_string_literal: true

class Accounts::SessionsController < Devise::SessionsController
  prepend_before_action :check_otp, only: [:create]

  private

  def check_otp
    account = Account.find_by_email(params[:account][:email])

    unless account || account.verify_otp(params[:otp])
      redirect_to new_account_session_path, alert: 'Wrong Google Auth code!'
    end
  end
end

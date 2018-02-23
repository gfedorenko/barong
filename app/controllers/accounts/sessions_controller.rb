# frozen_string_literal: true

class Accounts::SessionsController < Devise::SessionsController

  def create
    account = Account.find_by_email(resource_params[:email])

    if account.otp_enabled? && !account.verify_otp(params[:otp])
      set_flash_message!(:alert, :wrong_otp_code)
      redirect_to new_account_session_path
      return
    end

    super
  end

end


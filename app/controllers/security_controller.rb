# frozen_string_literal: true

#
# SecurityController
#
class SecurityController < ApplicationController
  # GET /security
  def enable
    current_account.update!(otp_enabled: true)
  end

  def display_code
    return render json: { answer: Account.find_by_email(params[:email]).otp_enabled}
  end

end

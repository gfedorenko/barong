# frozen_string_literal: true

#
# SecurityController
#
class SecurityController < ApplicationController
  # GET /security
  def enable
  end

  def display_code
    account = Account.find_by_email(params[:email])
    render json: { answer: account.present? && account.otp_enabled? }
  end

end

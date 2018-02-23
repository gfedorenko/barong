# frozen_string_literal: true

#
# SecurityController
#
class SecurityController < ApplicationController
  # GET /security
  def enable
  end

  def display_code
    render json: { answer: Account.find_by_email(params[:email]).otp_enabled? }
  end

end

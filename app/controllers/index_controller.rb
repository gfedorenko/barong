# frozen_string_literal: true

class IndexController < ApplicationController
  def index
    redirect_to new_account_session_url unless account_signed_in?
    if current_account
      redirect_to new_phone_path if current_account.level == 1
      redirect_to new_profile_path if current_account.level == 2 && !current_account.profile
    end
  end
end

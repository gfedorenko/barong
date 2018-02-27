class AddSecurity < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :otp_enabled, :boolean, default: false, after: :state
  end
end

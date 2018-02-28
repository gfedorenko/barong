if Rails.application.secrets.vault_adress.present? && Rails.application.secrets.vault_token.present?
  Vault.configure do |config|
    config.address = Rails.application.secrets.vault_adress
    config.token = Rails.application.secrets.vault_token
    config.ssl_verify = false
    config.timeout = 60
  end

  Rails.application.config.vault_enabled = true
else
  Rails.application.config.vault_enabled = false
end

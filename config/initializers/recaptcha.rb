if Rails.application.secrets.recaptcha.present?
  recaptcha = Rails.application.secrets.recaptcha.symbolize_keys

  Recaptcha.configure do |config|
    config.site_key = recaptcha[:site_key]
    config.secret_key = recaptcha[:secret_key]
    config.proxy = recaptcha[:proxy] if recaptcha[:proxy].present?
  end
end

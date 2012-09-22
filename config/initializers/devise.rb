Devise.setup do |config|
  config.mailer_sender = Settings.email

  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  # Facebook
  require 'omniauth-facebook'
  config.omniauth \
    :facebook,
    Settings.services.facebook.key,
    Settings.services.facebook.secret,
    client_options: {
      ssl: {
        ca_path: '/etc/ssl/certs'
      }
    }
end

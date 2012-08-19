Devise.setup do |config|
  config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  require "omniauth-facebook"
  config.omniauth :facebook, "408867965828793", "1543c0415583dd26bc7db3d37980e2df", client_options: {ssl: {ca_path: '/etc/ssl/certs'}}
end

# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  # The secret key used by Devise. Devise uses this key to generate
  # random tokens. Changing this key will render invalid all existing
  # confirmation, reset password and unlock tokens in the database.
  config.secret_key = '0a1a9222d975b6b7d468c2442cf3712a0e6df2f6746a36b170c70617bd10c358b9e818383a341c434208a17dd133b0a2ab9089df80f670340ae93f32b694c359'
  config.warden do |manager|
    manager.failure_app = CustomFailure
  end

  config.mailer_sender = 'info.mvive@gmail.com'

  require 'devise/orm/active_record'

  config.authentication_keys = [ :login ]

  config.case_insensitive_keys = [ :email ]

  config.strip_whitespace_keys = [ :email ]

  config.http_authenticatable_on_xhr = true

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 10

  config.allow_unconfirmed_access_for = 0.days

  config.reconfirmable = true

  config.remember_for = 2.weeks

  config.password_length = 8..32

  config.reset_password_within = 6.hours

  config.scoped_views = true

  config.navigational_formats = ['*/*', :html]

  config.sign_out_via = :delete

  config.omniauth :facebook, '1309144339133074', '98eca919530089f5853a17575e255b9c', {:client_options => {:ssl => {:verify => false}}}

end

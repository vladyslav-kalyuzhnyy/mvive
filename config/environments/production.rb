Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
  config.action_mailer.default_url_options = { :host => 'http://mvive.net/' }
  config.action_mailer.delivery_method = :smtp

  config.cache_classes = false
  config.eager_load = true

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.serve_static_assets = false
  config.assets.debug = true

  config.assets.js_compressor = :uglifier

  config.assets.compile = ['*.js', '*.css']
  config.active_support.deprecation = :silence

  config.assets.digest = true

  config.log_level = :info

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.log_formatter = ::Logger::Formatter.new

  config.active_record.dump_schema_after_migration = false
end

require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require 'carrierwave'
require 'carrierwave/orm/activerecord'

# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MVive
  class Application < Rails::Application
    #adding fonts to assets pipeline
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.assets.precompile += %w(.svg .eot .woff .ttf)
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths << Rails.root.join('lib')
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :ru
    config.assets.initialize_on_precompile = false
    config.assets.enabled = true

    ActionMailer::Base.smtp_settings = {

        :address            => 'smtp.gmail.com',
        :domain             => 'mail.google.com',
        :port               => 587,
        :user_name          => "info.mvive@gmail.com",
        :password           => "Qqqwwweee123",
        :authentication     => 'login',
        :enable_starttls_auto => true

    }
  end
end

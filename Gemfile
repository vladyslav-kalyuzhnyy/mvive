source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use SCSS for stylesheets
gem 'sass-rails'
gem 'bootstrap-sass'
gem 'mailboxer'
gem 'es5-shim-rails'
gem "font-awesome-rails"
gem 'carrierwave'
gem 'file_validators'
gem 'country_select'
gem 'html5shiv-rails'
gem "respond-rails", "~> 1.0"
gem 'rails_admin'
gem 'mail_form', '~> 1.5.0.rc'
gem 'simple_form', '~> 3.0.0.rc'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby
gem 'omniauth'
gem 'omniauth-facebook'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'pg', '0.15.1'
  gem 'rspec-rails'
  # The following optional lines are part of the advanced setup.
  # gem 'guard-rspec', '2.5.0'
  # gem 'spork-rails', '4.0.0'
  # gem 'guard-spork', '1.5.0'
  # gem 'childprocess', '0.3.6'
end
group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
  gem 'factory_girl_rails', '4.2.0'
  gem 'cucumber-rails', '1.4.0', :require => false
end

gem 'devise'
# Use debugger
# gem 'debugger', group: [:development, :test]
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin]
# Pagination gem
gem 'will_paginate', '~> 3.1'
# SiteMap gem
gem "dynamic_sitemaps"
group :development do
  gem 'capistrano', '3.5.0'
  gem 'capistrano-rvm'
  gem 'capistrano-nginx'
  gem 'capistrano3-puma'
  gem 'capistrano-rails'
  gem 'capistrano-rails-db'
  gem 'capistrano-rails-console'
  gem 'capistrano-upload-config'
  gem 'sshkit-sudo'
end

# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.2.2"

gem "rails", "~> 7.1.3", ">= 7.1.3.4"
gem "sprockets-rails"
gem "pg"
gem "puma"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-rspec'
end

group :development do
  gem "web-console"
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end


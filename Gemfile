source 'https://rubygems.org'
ruby '3.2.2'

gem 'bootsnap'
gem 'coffee-rails'
gem 'devise'
gem 'eco'
gem 'httparty', '>= 0.21.0'
gem 'jquery-rails'
gem 'json'
gem 'net-imap', '>= 0.5.6', require: false
gem 'net-smtp', require: false
gem 'newrelic_rpm'
gem 'nokogiri', '>= 1.18.3'
gem 'oauth'
gem 'pg'
gem 'puma', '>= 5.6.7'
gem 'rack', '>= 3.1.12'
gem "rails", "~> 7.2"
gem 'rails-html-sanitizer', '>= 1.4.4'
gem 'rake', '>= 10'
gem 'sass-rails'
gem 'sprockets-rails', require: 'sprockets/railtie'
gem 'terser', '~> 1.2.4'
gem 'view_component'

group :production, :staging do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'byebug'
  gem 'dotenv'
  gem 'factory_bot_rails'
  gem 'poltergeist'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rake', require: false
  gem 'rubocop-rspec', require: false
  gem 'spring'
end

group :development do
  gem 'listen'
  gem 'solargraph'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner-active_record'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'webmock'
end

gem 'dockerfile-rails', '>= 1.5', group: :development

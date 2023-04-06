source 'https://rubygems.org'
ruby '3.1.2'

gem 'bootsnap'
gem 'coffee-rails'
gem 'devise'
gem 'eco'
gem 'httparty', '>= 0.21.0'
gem 'jquery-rails'
gem 'json'
gem 'net-smtp', require: false
gem 'newrelic_rpm'
gem 'nokogiri', '>= 1.13.10'
gem 'oauth'
gem 'pg'
gem 'puma', '>= 5.5.1'
gem 'rack'
gem 'rails', '>= 7.0.4.3'
gem 'rails-html-sanitizer', '>= 1.4.4'
gem 'rake', '>= 10'
gem 'sass-rails'
gem 'sprockets-rails', require: 'sprockets/railtie'
gem 'uglifier', '>= 1.0.3'

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
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'vcr'
  gem 'webdrivers'
  gem 'webmock'
end

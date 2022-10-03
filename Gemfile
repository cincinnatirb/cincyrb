source 'https://rubygems.org'
ruby '3.0.4'

gem 'activeadmin'
gem 'bootsnap'
gem 'coffee-rails'
gem 'devise'
gem 'eco'
gem 'httparty'
gem 'jquery-rails'
gem 'json'
gem 'newrelic_rpm'
gem "nokogiri", ">= 1.12.5"
gem 'oauth'
gem 'pg'
gem 'puma', '>= 5.5.1'
gem 'rails', '6.0.4.1'
gem 'rake', '>= 10'
gem 'sass-rails'
gem 'sprockets-rails', require: 'sprockets/railtie'
gem 'uglifier', '>= 1.0.3'

group :production, :staging do
  gem 'rails_12factor'
end

group :development, :test do
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
end

group :test do
  gem 'capybara'
  gem 'database_cleaner-active_record'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'vcr'
  gem 'webdrivers'
  gem 'webmock'
end

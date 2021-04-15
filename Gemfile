source 'https://rubygems.org'
ruby '2.7.2'

gem 'rails', '5.2.4.5'
gem 'rake', '>= 10'
gem 'pg'
gem 'sprockets-rails', require: 'sprockets/railtie'

gem 'bootsnap'
gem 'devise'
gem 'jquery-rails'
gem 'eco'
gem 'httparty'
gem 'json'
gem 'activeadmin'
gem 'sass-rails'
gem 'newrelic_rpm'
gem 'puma'
gem 'coffee-rails'
gem 'uglifier', '>= 1.0.3'
gem 'oauth'

group :production, :staging do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'spring'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'byebug'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'dotenv'
  gem 'poltergeist'
end

group :development do
  gem 'listen'
end

group :test do
  gem 'database_cleaner-active_record'
  gem 'vcr'
  gem 'webmock'
end

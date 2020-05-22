source 'https://rubygems.org'
ruby '2.6.5'

gem 'rails', '4.2.8'
gem 'rake', '>= 10'
gem 'pg', '~> 0.11'
gem 'sprockets-rails', require: 'sprockets/railtie'

gem 'devise'
gem 'jquery-rails'
gem 'eco'
gem 'httparty'
gem 'json'
gem 'activeadmin', '1.4.3'
gem 'sass-rails'
gem 'newrelic_rpm'
gem 'protected_attributes'
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
  gem 'taps'
  gem 'rspec-rails', '~> 4.0'
  gem 'factory_girl_rails'
  gem 'dotenv'
  gem 'poltergeist'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'vcr'
  gem 'webmock'
end

source 'http://rubygems.org'
ruby '2.3.5'

gem 'rails', '4.1.15'
gem 'rake', '>= 10'
gem 'pg', '~> 0.18.4'
gem 'sprockets', '~> 3.7.2'

gem 'devise'
gem 'jquery-rails'
gem 'haml-rails', '~> 0.9.0'
gem 'eco'
gem 'httparty'
gem 'activeadmin', github: 'activeadmin', ref: '7c664ec'
gem 'sass-rails'
gem 'newrelic_rpm'
gem 'protected_attributes'
gem 'coffee-rails'
gem 'uglifier', '>= 1.0.3'
gem 'oauth'
gem 'websocket-extensions', '~> 0.1.5' # dependabot recommendation

group :production, :staging do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'spring', '~> 1.7.1'
  gem 'pry-rails'
  gem 'taps'
  gem 'rspec-rails', '~> 3.4.2'
  gem 'factory_girl_rails'
  gem 'dotenv'
  gem 'poltergeist'
end

group :test do
  gem 'cucumber-rails', '~> 1.4.3', :require => false
  gem 'database_cleaner'
  gem 'vcr', '~> 3.0.3'
  gem 'fakeweb'
end

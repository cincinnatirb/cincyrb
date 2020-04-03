source 'http://rubygems.org'
ruby '2.3.5'

gem 'rails', '4.1.15'
gem 'rake', '>= 10'
gem 'pg'
gem 'sprockets', '~> 3.7.2'

gem 'devise'
gem 'jquery-rails'
gem 'haml-rails'
gem 'eco'
gem 'httparty'
gem 'activeadmin', github: 'activeadmin'
gem 'sass-rails'
gem 'newrelic_rpm'
gem 'protected_attributes'
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
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'dotenv'
  gem 'konacha'
  gem 'poltergeist'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'vcr'
  gem 'fakeweb'
end

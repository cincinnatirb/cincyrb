source 'https://rubygems.org'
ruby '2.3.5'

gem 'rails', '~> 4.2.0'
gem 'rake', '>= 10'
gem 'pg'

gem 'devise'
gem 'jquery-rails'
gem 'haml-rails'
gem 'eco'
gem 'httparty'
gem 'activeadmin', '~> 1.0'
gem 'sass-rails', '~> 5.0'
gem 'newrelic_rpm'
gem 'coffee-rails', '~> 4.1.0'
gem 'uglifier', '>= 1.0.3'
gem 'oauth'

group :production, :staging do
  gem 'rails_12factor'
end

group :development, :test do
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

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

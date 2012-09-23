source 'https://rubygems.org'

gem 'rails', '3.2.8'

gem 'pg'

gem 'json'
gem 'slim'

gem 'devise', '~> 2.1.0'
gem 'omniauth-facebook'

gem 'carrierwave'
gem 'rmagick'
gem 'sidekiq'
gem 'rails_config'
gem 'active_model_serializers',
    git: 'https://github.com/josevalim/active_model_serializers.git'

group :assets do
  gem 'sass', '3.2.1'
  gem 'compass', '0.13.alpha.0'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'compass-rails'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'skim'
  gem 'therubyracer', platforms: :ruby
  gem 'uglifier', '>= 1.0.3'
  gem 'jquery-rails'
  gem 'jquery-rails-cdn'
  gem 'role-rails'
  gem 'modernizr'
  gem 'backbone-rails'
end

group :development do
  gem 'foreman'
  gem 'zeus'
end

group :development, :test do
  gem 'rspec-rails', '~> 2.11.0'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'guard-rspec'
  gem 'konacha'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'guard-cucumber'
  gem 'growl'

  # Front-end
  gem 'chai-jquery-rails'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
end

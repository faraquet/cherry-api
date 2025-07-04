# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'bcrypt', '~> 3.1.20'
gem 'jwt', '~> 2.8'
gem 'puma', '~> 6.4'
gem 'rails', '~> 8.0.2'
gem 'sqlite3', '~> 2.1'

gem 'bootsnap', '>= 1.18.0', require: false
gem 'ferrum', '~> 0.17', require: false
gem 'rqrcode', '~> 2.2', require: false
gem 'simple_command', '~> 1.0.1'

group :development, :test do
  gem 'dotenv-rails', '~> 3.1'
  gem 'pry-rails', '~> 0.3.11'
  gem 'pry-theme'

  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :development do
  gem 'listen', '~> 3.9'
  gem 'spring'
end

group :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 6.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

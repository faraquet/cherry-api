# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'bcrypt', '~> 3.1.7'
gem 'jwt', '~> 2.3'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'sqlite3', '~> 1.4'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'ferrum', '~> 0.11'
gem 'simple_command', '~> 0.1.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', '~> 2.7', '>= 2.7.6'
  gem 'pry-byebug', '~> 3.9.0'
  gem 'pry-rails', '~> 0.3.6'
  gem 'pry-theme'

  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false

  gem 'rspec-rails'

  gem 'factory_bot_rails'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

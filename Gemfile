# frozen_string_literal: true

source 'https://rubygems.org'

gem 'bcrypt', '~> 3.1.10'
gem 'dotenv', '~> 2.1', '>= 2.1.1'
gem 'erubis', '~> 2.7' # Template syntax
gem 'pg', '~> 0.18.4'
gem 'rack-protection', '~> 1.5.3'
gem 'rack_csrf', '~> 2.5.0'
gem 'rack', '~> 2.2', '>= 2.2.3'
gem 'roda', '~> 3.26.0' # Roda web framework
gem 'sequel', '~> 4.21'
gem 'tilt', '~> 2.0', '>= 2.0.8' # Templating engine
# gem 'puma', '~> 4.0'            # Web application server
gem 'rack-unreloader'

group :development do
  gem 'pry', '~> 0.12.2'
  gem 'sequel-annotate'
  gem 'rubocop', require: false
  gem 'rubocop-packaging', require: false
  gem 'rubocop-performance', require: false
end

group :development, :test do
  gem 'rspec-roda'
end

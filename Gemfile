# frozen_string_literal: true

source 'https://rubygems.org'

ruby File.read('.ruby-version').match(/\d\.\d.\d/)[0]

gem 'puma', '3.12.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'

gem 'dotenv-rails', '2.6.0'
gem 'foreman', '0.85.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.8.0'

gem 'active_model_serializers', '0.10.9'

group :development, :test do
  gem 'pry', '0.12.2'
  gem 'rspec-rails', '3.8.2'
end

group :test do
  gem 'database_cleaner', '1.7.0'
  gem 'factory_bot_rails', '5.0.0'
  gem 'faker', '1.9.3'
  gem 'json-schema', '2.8.1'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'overcommit', require: false

  # Spring speeds up development by keeping your application running
  # in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'

  gem 'rubocop', require: false
  gem 'rubycritic', require: false
end

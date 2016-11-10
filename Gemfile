# frozen_string_literal: true
source 'https://rubygems.org'

ruby File.read('.ruby-version').match(/\d\.\d.\d/)[0]

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'puma', '~> 3.0'

gem 'dotenv-rails'
gem 'foreman'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

group :mysql2, optional: true do
  gem 'mysql2', '>= 0.4.5'
end

group :sqlserver, optional: true do
  gem 'tiny_tds'
  gem 'activerecord-sqlserver-adapter',
      github: 'rails-sqlserver/activerecord-sqlserver-adapter'
end

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :development do
  gem 'listen', '~> 3.0.5'

  # Spring speeds up development by keeping your application running
  # in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'rubycritic', require: false
  gem 'rubocop', require: false
  gem 'overcommit', require: false
end

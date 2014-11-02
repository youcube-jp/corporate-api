source 'https://rubygems.org'

gem 'rails', '4.1.6'

# Assets
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'bootstrap-sass'
gem 'font-awesome-sass'

# Views
gem 'haml-rails'
gem 'jbuilder'

group :development, :test do
  # Database
  gem 'sqlite3'

  # Specs
  gem 'rspec-rails'
  gem 'rspec-collection_matchers'
  gem 'factory_girl_rails'
  gem 'faker', require: false

  # Development Tools
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'rspec-kickstarter'

  # Debugging
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
  gem 'pry-byebug'
end

group :staging, :production do
  # Database
  gem 'pg'

  # Javascript Runtime
  gem 'therubyracer'

  # AP Server
  gem 'unicorn'
end


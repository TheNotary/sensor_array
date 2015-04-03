source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.4'
gem 'thin'
#gem 'faye'

#gem 'ruby_pi_tc', path: "~/dev/ruby/ruby_pi_tc/" if File.exists?(".using_clocker")

# Use sqlite3 as the database for Active Record
group :development do
  gem 'sqlite3' if ENV['HEROKU_DEPLOYMENT'].nil?
end

gem 'pg' unless ENV['HEROKU_DEPLOYMENT'].nil?


# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'
gem 'haml'
gem 'haml-rails'

gem 'bootstrap-sass'

gem "nested_form"

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
#gem 'therubyracer', platforms: :ruby
gem 'execjs'


# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'


gem "devise"
gem 'protected_attributes'
gem "wiringpi"

gem "pry"


# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

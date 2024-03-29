source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Set default ruby version
ruby "2.5.1"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'
# Use pg as the database for Active Record to match production
gem 'pg'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use devise as user authentication
gem 'devise'

# Install jquery rails
gem 'jquery-rails'
# dunno why
gem 'jquery-turbolinks'

# Install new relic
gem 'newrelic_rpm'

# Install friendlyid to make url prettier
gem 'friendly_id'

# Install redcarpet for markdown parser
gem 'redcarpet'

# Install ancestry for comment nesting
gem 'ancestry'

gem 'kaminari'
gem 'font-awesome-sass'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# gem for voting system
gem 'acts_as_votable', '~> 0.10.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver using guide from
  # "Everyday testing with rails"
  gem 'capybara'
  gem 'poltergeist'
  gem 'selenium-webdriver'
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "faker"
  gem "database_cleaner"
  gem "launchy"
  gem "guard-rspec"
  gem 'spring-commands-rspec'
  gem 'simplecov', :require => false
end

  # move listen to global gem
  gem 'listen', '>= 3.0.5', '< 3.2'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Follow tutorial https://www.digitalocean.com/community/tutorials/deploying-a-rails-app-on-ubuntu-14-04-with-capistrano-nginx-and-puma
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# README

## Server

DigitalOcean Using this tutorial [Deploying a Rails App on Ubuntu 14.04 with Capistrano, Nginx, and Puma](https://www.digitalocean.com/community/tutorials/deploying-a-rails-app-on-ubuntu-14-04-with-capistrano-nginx-and-puma)

SSL[Let's Encrypt](https://certbot.eff.org/#ubuntuxenial-nginx)  
Renewal:
```ruby
certbot renew --dry-run
```

### nginx configuration
TODO

## Installing

- Ruby version:
```ruby
2.4.0
```
- Rails version:
```ruby
5.1.1
```

Then run:
```ruby
bundle install
rails db:migrate
# Or
# Rails db:reset if you already have a development database
rails server
```

## Testing

Using guide from "Everyday Testing with Rails."

Added to gemfile:
```ruby
group :development, :test do 
    gem "rspec-rails"
    gem "factory_girl_rails"
    gem "faker"
    gem "database_cleaner"
    gem "launchy"
    # On chapter 9, Speedng up specs
    gem "guard-rspec"
    gem 'spring-commands-rspec'
end
```

To run the automatic test:
```ruby
guard
# Then press return to run all the test
```

### Testing Syntax

- [Shoulda gem](https://github.com/thoughtbot/shoulda).
```ruby
context "associations" do
  should have_many(:posts)
end
```

## Application

### Authentication
- Install devise using this [tutorial](https://github.com/plataformatec/devise#getting-started).

- Add username using this [tutorial](https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign-in-using-their-username-or-email-address).

- TODO [Allow users to recover their password or confirm their account using their username](https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign-in-using-their-username-or-email-address#allow-users-to-recover-their-password-or-confirm-their-account-using-their-username).
- 

### Model

### Post

### Views


## Todo

- Logo
- Favicon

- Ensure you have flash messages in app/views/layouts/application.html.erb.
 For example:
 ```ruby
    <p class="notice"><%= notice %></p>
    <p class="alert"><%= alert %></p>
 ```
- Confirmable email


## Bug

- Hardcoded SECRET_KEY_BASE in secrets.yml
- Hardcoded postgresql password in secrets.yml
- Not setting firewall


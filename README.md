# README

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
end
```



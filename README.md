# RailsApiGuard

A pluggable, configurable rate limiting middleware for Rails APIs with Redis backend, Slack alerts, and endpoint exclusions.

## 🚀 Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_api_guard'
```

And then execute:
```bash
$ bundle install
```

Or install it yourself as:
```bash
$ gem install rails_api_guard
```

## Generate the Initializer
```bash
rails generate rails_api_guard:install
```

## Configuration
Edit `config/initializers/rails_api_guard.rb` to set request limits, expiry time, Slack alerts, and excluded endpoint patterns.

## Contributing
Contribution directions are yet to add.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

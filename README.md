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

## Middleware
Add this to application.rb if not used generator
```ruby
config.middleware.use RailsApiGuard::Middleware::RateLimiter
```

## Configuration
Edit `config/initializers/rails_api_guard.rb` to set request limits, expiry time, Slack alerts, and excluded endpoint patterns.

## Slack Notifications

RailsApiGuard can optionally send Slack alerts whenever a request exceeds the defined rate limit threshold.

### Configuration

To enable Slack alerts, set your Slack webhook URL in the initializer:

```ruby
# config/initializers/rails_api_guard.rb
RailsApiGuard.configure do |config|
  config.slack_webhook_url = ENV["SLACK_WEBHOOK_URL"]
end

## Contributing
Contribution directions are yet to add.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

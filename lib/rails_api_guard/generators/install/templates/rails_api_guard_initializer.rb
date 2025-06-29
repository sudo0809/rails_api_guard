# config/initializers/rails_api_guard.rb

# RailsApiGuard configuration initializer
#
# This file allows you to customize rate limiting behavior for your Rails API.
# You can adjust request limits, expiry time, Slack notifications, and exclusion rules
# for specific endpoints from rate limiting.
#
# You can safely add, remove, or modify these settings as per your application needs.

RailsApiGuard.configure do |config|
  # 🚦 Maximum number of allowed requests within the expiry_time window per IP (or per key)
  config.limit = 5

  # 🕒 Expiry time (in seconds) for the rate limiting window.
  # After this time window passes, the request count for an IP or key resets.
  config.expiry_time = 60

  # 🔔 Slack webhook URL for sending alerts when a client exceeds the rate limit.
  # Best practice: set this securely via environment variables.
  config.slack_webhook_url = ENV['SLACK_WEBHOOK_URL']

  # 🚫 List of endpoint patterns to be excluded from rate limiting.
  #
  # Supports:
  # - Exact string paths (e.g. '/healthcheck')
  # - Wildcard patterns (e.g. '/public/*')
  # - Regular expressions (must start with '^', e.g. '^/user/\d+/document/\w+$')
  #
  # 👉 This list is **fully extendable** — feel free to add any additional paths
  # or dynamic route patterns you want to bypass the rate limiter.
  #
  # Example:
  # config.excluded_patterns << '/open-api/*'
  #
  config.excluded_patterns = [
    '/healthcheck',
    '/public/*',
    '^/user/\\d+/document/\\w+$'
  ]
end

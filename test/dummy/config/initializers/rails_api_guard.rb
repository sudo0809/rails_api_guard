RailsApiGuard.configure do |config|
    config.excluded_patterns = [
        "/healthcheck",
        "/public/*",
        "^/user/\\d+/document/\\w+$"
      ]
    
      config.limit = 5
      config.expiry_time = 60
      config.slack_webhook_url = ENV["SLACK_WEBHOOK_URL"]
end

module RailsApiGuard
    class Config
        attr_accessor :excluded_patterns, :limit, :expiry_time, :slack_webhook_url

        def initialize
            @excluded_patterns = []
            @limit = 5 
            @expiry_time = 60 # in seconds
            @slack_webhook_url = nil
        end
    end
end
module RailsApiGuard
    module Services
        class RedisClient
            def self.instance
                @instance ||= Redis.new
            end
        end
    end
end
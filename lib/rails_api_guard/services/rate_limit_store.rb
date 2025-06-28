module RailsApiGuard
    module Services
        class RateLimitStore
            def initialize(limit, expiry_time)
                @limit = limit
                @expiry_time = expiry_time
                @redis = RedisClient.instance
            end

            def increment_and_check(ip, path)
                key = "rate_limiter::#{ip}::#{path}"
                current_count = @redis.get(key).to_i

                if current_count == 0
                    @redis.setex(key, @expiry_time, 0)
                end

                @redis.incr(key)

                current_count + 1 > @limit
            end
        end
    end
end
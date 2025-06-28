require "pry"


module RailsApiGuard
    module Middleware
        class RateLimiter
            def initialize(app)
                @app = app
                @limit = RailsApiGuard.config.limit
                @expiry_time = RailsApiGuard.config.expiry_time
                @rate_limit_store = Services::RateLimitStore.new(@limit, @expiry_time)
            end

            def call(env)
                request = Rack::Request.new(env)
                
                if Services::ExclusionChecker.excluded_endpoint?(request.path)
                    Rails.logger.info "Skipping rate limiting for #{request.path}"
                    return @app.call(env)
                end
               
                ip = request.ip
                
                
                if @rate_limit_store.increment_and_check(ip, request.path)
                    Rails.logger.info "Rate limiting exceeded!!!"
                    Services::SlackNotifier.notify("🚨 Rate limit exceeded for #{ip}!")
                    return too_many_requests
                end


                @app.call(env)
            end
            
            private

            def too_many_requests
                [
                    429,
                    { "Content-Type" => "application/json" },
                    [{ error: "Rate limit exceeded" }.to_json]
                  ]
            end
        end
    end
end

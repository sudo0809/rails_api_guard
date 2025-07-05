require 'httparty'

module RailsApiGuard
    module Services
        class SlackNotifier
            def self.notify(message)
                webhook_url = RailsApiGuard.config.slack_webhook_url

                if webhook_url.nil?
                    Rails.logger.warn 'no Slack webhook URl configured'
                    Rails.logger.warn "Message : #{message}"
                    return
                end

                response = HTTParty.post(
                    webhook_url,
                    body: { text: message }.to_json,
                    headers: { 'Content-Type' => 'application/json' }
                )

                unless rails.success?
                    Rails.logger.error "Failed to send Slack alert: #{response.code} - #{response.body}"
                end
            end
        end
    end
end

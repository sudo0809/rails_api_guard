require 'httparty'

module RailsApiGuard
    module Services
        class SlackNotifier
            def self.notify(message)
                webhook_url = RailsApiGuard.config.slack_webhook_url
                return unless webhook_url.present?
        
                payload = { text: message }
        
                HTTParty.post(webhook_url, body: payload.to_json, headers: { 'Content-Type' => 'application/json' })
            end
        end
    end
end

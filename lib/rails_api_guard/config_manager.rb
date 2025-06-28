require "yaml"

module RailsApiGuard
  class ConfigManager
    def self.excluded_patterns
      config["excluded_patterns"] || []
    end

    def self.limit
      config["limit"] || 5
    end

    def self.expiry_time
      config["expiry_time"] || 60
    end

    def self.slack_webhook_url
      config["slack_webhook_url"]
    end

    def self.config
      @config ||= load_config
    end

    def self.load_config
      config_file = Rails.root.join("config/rails_api_guard.yml")
      unless File.exist?(config_file)
        Rails.logger.warn "⚠️ Rails API Guard config file missing at #{config_file}"
        return {}
      end

      YAML.load_file(config_file) || {}
    end

    def self.reload!
      @config = load_config
    end
  end
end

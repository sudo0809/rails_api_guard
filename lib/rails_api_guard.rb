require "rails_api_guard/version"
require "rails_api_guard/engine"
require "rails_api_guard/middleware/rate_limiter"
require "rails_api_guard/config"
require "redis"

module RailsApiGuard
  class << self
    attr_accessor :config
  end

  def self.configure
    self.config ||= Config.new
    yield(config)
  end
end

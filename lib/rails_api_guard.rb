require "rails_api_guard/version"
require "rails_api_guard/engine"
require "rails_api_guard/middleware/rate_limiter"
require "rails_api_guard/config"
require "redis"
require "rails_api_guard/generators/install/install_generator"


module RailsApiGuard
  class << self
    attr_accessor :config
  end

  self.config ||= Config.new

  def self.configure
    yield(config) if block_given?
  end
end

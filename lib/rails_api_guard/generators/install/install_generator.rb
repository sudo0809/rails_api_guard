require "rails/generators"

module RailsApiGuard
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      desc "Creates a RailsApiGuard initializer file."

      def copy_initializer
        template "rails_api_guard_initializer.rb", "config/initializers/rails_api_guard.rb"
      end
    end
  end
end

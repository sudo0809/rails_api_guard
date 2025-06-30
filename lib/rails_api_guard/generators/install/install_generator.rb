require "rails/generators"

module RailsApiGuard
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      desc "Creates a RailsApiGuard initializer file."

      def copy_initializer
        template "rails_api_guard_initializer.rb", "config/initializers/rails_api_guard.rb"
      end

      def add_middleware
        application_file = 'config/application.rb'
        middleware_pattern = /config\.middleware\.use RailsApiGuard::Middleware::RateLimiter/
        middleware_line = "\t\t# Added by RailsApiGuard gem to apply API rate limiting middleware\n"
        middleware_line += "\t\tconfig.middleware.use RailsApiGuard::Middleware::RateLimiter\n"

        if File.readlines(application_file).grep(/config\.middleware\.use RailsApiGuard::Middleware::RateLimiter/).any?
          say_status :skipped, "Middleware already added to #{application_file}", :yellow
        else
          insert_into_file application_file, "\n\n#{middleware_line}", after: "class Application < Rails::Application"
          say_status :added, "Middleware added to #{application_file}", :green
        end
      end
    end
  end
end

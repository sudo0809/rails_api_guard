module RailsApiGuard
  class Engine < ::Rails::Engine
    isolate_namespace RailsApiGuard

    config.eager_load_paths << root.join("lib")
  end
end

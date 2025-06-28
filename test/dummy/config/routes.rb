Rails.application.routes.draw do
  mount RailsApiGuard::Engine => "/rails_api_guard"

  get "healthcheck", to: "healthcheck#index"
end

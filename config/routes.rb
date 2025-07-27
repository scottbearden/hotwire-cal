Rails.application.routes.draw do
  # Root route - choose one based on what you want as your homepage
  root to: "calendars#index"  # Remove the duplicate and choose this OR main#index

  # Health check for monitoring
  get "up" => "rails/health#show", as: :rails_health_check

  # Authentication routes
  resources :sessions, only: [ :new, :create ]
  resources :registrations, only: [ :new, :create ]
  get "logout", to: "sessions#destroy", as: :logout

  # Main application routes
  get "main/index"
  resources :calendars
  resources :events

  # Settings namespace
  namespace :settings do
    resource :account, only: [ :edit ]
    resource :password, only: [ :edit, :update ]
    resource :personal_details, only: [ :edit, :update ]
  end

  # Development-only routes
  if Rails.env.development? || Rails.env.test?
    mount MissionControl::Jobs::Engine, at: "/jobs"
  end

  # PWA routes (commented for future use)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end

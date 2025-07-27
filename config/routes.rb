Rails.application.routes.draw do
  get "main/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Mount Mission Control for job monitoring (restricted to development/local for now)
  mount MissionControl::Jobs::Engine, at: "/jobs" if Rails.env.development? || Rails.env.test?

  # Authentication
  resources :sessions, only: [ :new, :create ]
  get "logout", to: "sessions#destroy", as: :logout

  # Authentication
  resources :registrations, only: [ :new, :create ]

  namespace :settings do
    resource :account, only: [ :edit ]
    resource :personal_details, only: [ :edit, :update ]
  end

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root to: "main#index"
end

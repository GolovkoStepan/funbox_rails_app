require 'sidekiq/web'

Rails.application.routes.draw do
  root to: "site#index"
  get "admin", to: "site#admin"

  mount Sidekiq::Web => '/sidekiq'
end

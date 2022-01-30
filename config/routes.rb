# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'site#index'
  get 'admin', to: 'site#admin'
  post 'admin', to: 'site#force_rate'

  mount Sidekiq::Web => '/sidekiq'
end

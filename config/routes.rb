Rails.application.routes.draw do
  root to: "site#index"
  get "admin", to: "site#admin"
end

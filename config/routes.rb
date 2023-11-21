Rails.application.routes.draw do
  devise_for :users

  resources :groups

  resources :financial_transactions, only: [:new, :create]

  root "groups#index"

  get "up" => "rails/health#show", as: :rails_health_check
end

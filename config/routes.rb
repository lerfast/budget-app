Rails.application.routes.draw do
  get 'home/index'
  devise_for :users

  resources :groups

  resources :financial_transactions
  

  root 'home#index'

  get "up" => "rails/health#show", as: :rails_health_check
end

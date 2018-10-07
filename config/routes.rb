Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :payments
      resources :companies
      root to: "users#index"
    end
  namespace :merchant do
      resources :users
      resources :payments
      root to: "users#index"
    end
  root to: 'visitors#index'
  devise_for :users
  as :user do
    get 'login', to: 'devise/sessions#new'
    get 'logout', to: 'devise/sessions#destroy'
  end
  resources :users
end

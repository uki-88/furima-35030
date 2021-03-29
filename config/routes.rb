Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  resources :items
  resources :purchases, only: [:new, :create]
end

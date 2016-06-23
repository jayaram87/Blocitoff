Rails.application.routes.draw do
  get "homepage/index"
  devise_for :users
  resources :users, only: [:show] do
    resources :items, only: [:new, :create]
  end
  root 'users#show'
end

Rails.application.routes.draw do
  get "homepage/index"
  devise_for :users
  resources :users, only: [:show] do
    resources :items, only: [:create, :destroy]
  end
  root 'users#show'
end

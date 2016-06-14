Rails.application.routes.draw do
  get "homepage/index"
  root 'homepage#index'
  devise_for :users
end

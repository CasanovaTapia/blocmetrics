Rails.application.routes.draw do
  resources :apps

  devise_for :users
  get 'static/home'

  root to: 'static#home'
end

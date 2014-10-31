Rails.application.routes.draw do
  resources :events, except: [:index]

  match 'events' => "events#index", via: :options

  devise_for :users

  get 'static/about'
  get 'static/index'

  root to: 'static#index'
end

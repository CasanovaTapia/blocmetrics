Rails.application.routes.draw do
  resources :events, except: [:index]

  match 'events' => "events#index", via: :options

  devise_for :users

  # get 'static/home'

  root to: 'events#index'
end

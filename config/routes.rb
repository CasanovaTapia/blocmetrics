Rails.application.routes.draw do
  resources :events, except: [:index]

  match 'events' => "events#index", via: :options

  devise_for :users

  get 'static/about'

  root to: 'events#index'
end

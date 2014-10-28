Rails.application.routes.draw do
  resources :apps do
    resources :events, except: [:index]
  end

  match 'events' => "events#index", via: :options

  devise_for :users

  get 'static/home'

  root to: 'static#home'
end

Rails.application.routes.draw do
  resources :apps do
    resources :events, except: [:index]
  end

  devise_for :users

  match 'events' => "events#index", via: :options

  get 'static/home'

  root to: 'static#home'
end

Rails.application.routes.draw do
  resources :apps do
    resources :events, except: [:index]
  end

  devise_for :users
  get 'static/home'

  root to: 'static#home'
end

Rails.application.routes.draw do
  get 'static/home'

  root to: 'static#home'
end

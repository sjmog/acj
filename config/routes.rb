Rails.application.routes.draw do
  resources :tasks
  resources :codes
  devise_for :coaches

  root to: 'tasks#index'
end

Rails.application.routes.draw do
  resources :tasks
  devise_for :coaches

  root to: 'tasks#index'
end

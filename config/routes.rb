Rails.application.routes.draw do
  devise_for :coaches

  get '/', to: 'welcome#index'
end

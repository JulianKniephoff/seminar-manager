Rails.application.routes.draw do
  root to: 'static_pages#home'

  resources :topics do
    resources :comments, shallow: true
    resources :likes, only: [:index, :create, :destroy], shallow: true
  end

  # Authentication
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  #get '/auth/failure', to: 'sessions#failure'
  # TODO Use resourceful routing for new and delete?
  get '/login', to: 'sessions#new', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
end

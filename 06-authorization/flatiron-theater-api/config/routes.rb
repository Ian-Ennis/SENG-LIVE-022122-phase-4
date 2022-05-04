Rails.application.routes.draw do
  resources :tickets, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:show, :create, :update, :destroy]
  resources :production_roles
  resources :productions, only: [:index, :create, :show, :destroy]

  # Initially Authenticate User
  get '/authorized_user', to: 'users#show'

  # Login / Logout Routes
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'
end

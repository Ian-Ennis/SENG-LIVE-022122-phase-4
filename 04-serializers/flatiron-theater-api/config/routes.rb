Rails.application.routes.draw do
  resources :tickets, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :production_roles
  resources :productions, only: [:index, :show, :destroy]

#  get '/production', to: 'production#index'
end

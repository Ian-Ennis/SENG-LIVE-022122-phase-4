Rails.application.routes.draw do
  
  # GROUP ACTIVITY => Add Routes for Update / Destroy Actions

  resources :productions, only: [:index, :show, :create, :update, :destroy]
  resources :production_roles, only: [:index, :show, :create, :update, :destroy]
  resources :tickets, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:index, :show, :create, :update, :destroy]
end

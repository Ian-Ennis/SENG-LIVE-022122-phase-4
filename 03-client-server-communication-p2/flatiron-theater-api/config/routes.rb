Rails.application.routes.draw do
  
  # GROUP ACTIVITY => Add Routes for Update / Destroy Actions

  resources :productions, only: [:index, :show, :create]
  resources :production_roles, only: [:index, :show, :create]
  resources :tickets, only: [:index, :show, :create]
  resources :users, only: [:index, :show, :create]
end

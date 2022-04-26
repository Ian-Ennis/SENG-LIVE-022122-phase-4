Rails.application.routes.draw do
  
  # GROUP ACTIVITY #1
  
  # Add Routes to Accommodate New Actions Added to Controllers
  
  resources :productions, only: [:index, :show, :create]
  resources :production_roles, only: [:index, :show, :create]
  resources :tickets, only: [:index, :show, :create]
  resources :users, only: [:index, :show, :create]
end

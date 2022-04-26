Rails.application.routes.draw do
  
  # GROUP ACTIVITY #1
  
  # Add Routes to Accommodate New Actions Added to Controllers
  
  resources :productions, only: [:index, :show]
  resources :production_roles, only: [:index, :show]
  resources :tickets, only: [:index, :show]
  resources :users, only: [:index, :show]
end

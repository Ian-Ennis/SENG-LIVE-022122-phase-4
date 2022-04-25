Rails.application.routes.draw do
  # GROUP ACTIVITY #2

  # 1. Add Resources for Tickets
  # 2. Add Resources for Users
  # 3. Add Resources for Production Roles

  # NOTE: Make sure to check routes in console with "rails routes"
  
  # "/productions", "/productions/:id"
  resources :productions, only: [:index, :show]
  
  # "/production_roles", "/production_roles/:id"
  resources :production_roles, only: [:index, :show]
  
  # "/tickets", "/tickets/:id"
  resources :tickets, only: [:index, :show]
  
  # "/users", "/users/:id"
  resources :users, only: [:index, :show]
end

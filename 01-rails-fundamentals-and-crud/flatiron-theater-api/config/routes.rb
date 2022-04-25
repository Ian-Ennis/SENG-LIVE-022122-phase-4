# "The Rails.application.routes.draw do ... end block that wraps your route 
# definitions is required to establish the scope for the router DSL and must 
# not be deleted."
# https://guides.rubyonrails.org/routing.html#configuring-the-rails-router

# "Rails offers a way to break a gigantic single routes.rb file into multiple 
# small ones using the draw macro."
# https://guides.rubyonrails.org/routing.html#breaking-up-very-large-route-file-into-multiple-small-ones

# In other words, "draw" allows us to compress multiple routes into one location 
# (i.e., routes.rb) for ease of reference / increased scalability.

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

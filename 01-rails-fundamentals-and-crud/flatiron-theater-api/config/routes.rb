Rails.application.routes.draw do
  # GROUP ACTIVITY #2

  # 1. Add Resources for Tickets
  # 2. Add Resources for Users
  # 3. Add Resources for Production Roles

  # NOTE: Make sure to check routes in console with "rails routes"
  
  resources :productions, only: [:index, :show]
  #  get '/productions', to: 'production#index'
end

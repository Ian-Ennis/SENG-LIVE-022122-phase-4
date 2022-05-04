class SessionsController < ApplicationController
    # Group Activity => Add Action (sessions#login) To Handle Login
    
    def login
        
        # Find User via unique "username" params
        user = User.find_by!(name: params[:username])

        # IF FOUND => user = some user instance (NOT FALSEY)
        # IF NOT FOUND => user = nil (FALSEY)

        # if user && user.authenticate("password")
        if user&.authenticate(params[:password])
            # If User authenticates, render Welcome Message with "status: :ok"
            render json: {user: "Welcome to Flatiron Theater API!"}, status: :ok 
        else
            # If User does not authenticate, render "Invalid Password or Username" with "status: :unprocessable_entity"
            render json: { error: "Invalid Password or Username"}, status: :unprocessable_entity
        end
    end
end

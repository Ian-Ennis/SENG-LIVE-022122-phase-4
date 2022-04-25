class UsersController < ApplicationController
    
    # "/users"
    def index 
        # GROUP ACTIVITY 1: Adding ActiveRecord Queries
        # Pull all Users and render in JSON format
        render json: User.all
    end 

    # "/users/1"
    def show

        # GROUP ACTIVITY 1: Adding ActiveRecord Queries
        # Find User by "id" params and render in JSON format along with associated Tickets

        # NOTE => Use "byebug" to test your code in Terminal
        # byebug
        user = User.find(params[:id])
        render json: user, include: :tickets
    end 
end
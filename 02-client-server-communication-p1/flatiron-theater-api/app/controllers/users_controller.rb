class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    # "/users"
    def index 
        render json: User.all
    end 

    # "/users/:id"
    def show
        user = User.find(params[:id])
        render json: user, include: :tickets
    end
    
    # GROUP ACTIVITY #1
    def create
        user = User.create!(user_params)
        
        # Add Code to Check Whether Processable Entity

        render json: user, status: :created

        # If Yes, Return New Production in JSON Format With Status of Created
    end

    private

    # GROUP ACTIVITY #1
    def user_params
        # Add Strong Params for Each New User
        params.permit(:name, :admin)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
end
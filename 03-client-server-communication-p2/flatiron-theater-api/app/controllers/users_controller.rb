class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    # GET "/users"
    def index 
        render json: User.all
    end 

    # GET "/users/:id"
    def show
        user = User.find(params[:id])
        render json: user, include: :tickets
    end
    
    # POST "/users"
    def create
        user = User.create!(user_params)
        render json: user, status: :created
    end

    # GROUP ACTIVITY => Add Update / Destroy Actions

    # PUT "/users/:id"
    def update
        # Find User via Params (id)

        # If Found, Render User With Created Status

            # Update User with user_params

            # If Errors, Raise Exception + Render Errors in JSON Format w/ Unprocessable Entity Status

        # If Not Found, Raise Exception + Render Errors in JSON Format w/ Not Found Status
    end

    # DELETE "/users/:id"
    def destroy
        # Find User via Params (id)

        # If Found, Destroy User

            # Render 204 Status Code (No Content) / Send No Content in Response 

        # If Not Found, Raise Exception + Render Errors in JSON Format w/ Not Found Status
    end

    private

    def user_params
        params.permit(:name, :admin)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
end
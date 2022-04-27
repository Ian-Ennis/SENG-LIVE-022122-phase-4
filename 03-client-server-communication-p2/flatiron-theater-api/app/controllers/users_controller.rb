class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

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
        user = User.find(params[:id])

        # If Found, Update / Render User With Created Status
        user.update!(user_params)
        render json: user, status: :created
    end

    # DELETE "/users/:id"
    def destroy
        # Find User via Params (id)
        user = User.find(params[:id])

        # If Found, Destroy User
        user.destroy

        # Render 204 Status Code (No Content) / Send No Content in Response 
        head :no_content

        # render json: user
    end

    private

    def user_params
        params.permit(:name, :admin)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

    def render_not_found_response(invalid)
        render json: { errors: invalid }, status: :not_found
    end
end
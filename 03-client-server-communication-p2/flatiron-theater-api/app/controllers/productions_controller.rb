class ProductionsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    # GET "/productions"
    def index 
        render json: Production.all
    end 

    # GET "/productions/:id"
    def show
        production = Production.find(params[:id])
        render json: production, include: :production_roles
    end

    # POST "/productions"
    def create
        production = Production.create!(production_params)
        render json: production, status: :created
    end

    # GROUP ACTIVITY => Add Update / Destroy Actions

    # PUT "/productions/:id"
    def update
        # Find Production via Params (id)

        # If Found, Render Production With Created Status

            # Update Production with production_params

            # If Errors, Raise Exception + Render Errors in JSON Format w/ Unprocessable Entity Status

        # If Not Found, Raise Exception + Render Errors in JSON Format w/ Not Found Status
    end

    # DELETE "/productions/:id"
    def destroy
        # Find Production via Params (id)

        # If Found, Destroy Production

            # Render 204 Status Code (No Content) / Send No Content in Response 

        # If Not Found, Raise Exception + Render Errors in JSON Format w/ Not Found Status
    end

    private

    def production_params
        params.permit(:title, :genre, :description, :budget, :image, :director, :ongoing)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
end

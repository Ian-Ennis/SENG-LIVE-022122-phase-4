class ProductionsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    # READ
    # "/productions"
    def index 
        render json: Production.all
    end 

    # READ
    # "/productions/:id"
    def show
        production = Production.find(params[:id])
        render json: production, include: :production_roles
    end

    # GROUP ACTIVITY #1
    # CREATE
    def create
        
        # create! + save! => Raise AR Exception if  Unsuccessful
        production = Production.create!(production_params)
        
        # Add Code to Check Whether Processable Entity

        # if production.valid?
        #     render json: production, status: :created
        # else
        #     render json: { errors: production.errors }, status: :unprocessable_entity
        # end

        # If Yes, Return New Production in JSON Format With Status of Created

        render json: production, status: :created
    end

    private

    # GROUP ACTIVITY #1
    def production_params
        # Add Strong Params for Each New Production
        params.permit(:title, :genre, :description, :budget, :image, :director, :ongoing)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
end

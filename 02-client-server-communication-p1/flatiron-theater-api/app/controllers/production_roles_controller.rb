class ProductionRolesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    # "/production_roles"
    def index 
        render json: ProductionRole.all
    end 

    # "/production_roles/:id"
    def show
        production_role = ProductionRole.find(params[:id])
        render json: production_role, include: :production
    end

    # GROUP ACTIVITY #1
    def create

        production_role = ProductionRole.create!(production_role_params)
        
        # Add Code to Check Whether Processable Entity

        render json: production_role, status: :created
    end

    private

    # GROUP ACTIVITY #1
    def production_role_params
        # Add Strong Params for Each New Production Role
        params.permit(:role, :understudy, :production_id)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
end

class ProductionRolesController < ApplicationController

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
        # Add Code to Check Whether Processable Entity
        
        # If Yes, Return New Production Role in JSON Format With Status of Created

        # If No, Return Errors With Status of Unprocessable Entity
    end

    private

    # GROUP ACTIVITY #1
    def production_role_params
        # Add Strong Params for Each New Production Role
    end
end

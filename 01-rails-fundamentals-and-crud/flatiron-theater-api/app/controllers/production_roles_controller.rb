class ProductionRolesController < ApplicationController

    # "/production_roles"
    def index 
        render json: ProductionRole.all
    end 

    # "/productions/:id"
    def show
        # byebug
        production_role = ProductionRole.find(params[:id])
        render json: production_role, include: :production
    end
end

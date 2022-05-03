class ProductionRolesController < ApplicationController

    # GET "/production_roles"
    def index 
        render json: ProductionRole.all
    end 

    # GET "/production_roles/:id"
    def show
        production_role = ProductionRole.find(params[:id])
        render json: production_role, include: :production
    end

    # POST "/production_roles"
    def create
        production_role = ProductionRole.create!(production_role_params)
        render json: production_role, status: :created
    end

    # PUT "/production_roles/:id"
    def update
        production_role = ProductionRole.find(params[:id])
        production_role.update!(production_role_params)
        render json: production_role, status: :created
    end

    # DELETE "/production_roles/:id"
    def destroy
        production_role = ProductionRole.find(params[:id])
        production_role.destroy
        head :no_content
    end

    private

    def production_role_params
        params.permit(:role, :understudy, :production)
    end
end

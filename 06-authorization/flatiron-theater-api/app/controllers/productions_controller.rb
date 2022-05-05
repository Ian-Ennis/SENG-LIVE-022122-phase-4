class ProductionsController < ApplicationController
    # Group Activity => Set 'is_admin' to Fire Only Before Create + Destroy Actions

    # - We only want Admins to have the capability to create / destroy Productions
    # - Users should only be able to view all / individual productions

    before_action :is_admin, only: [:create, :destroy, :update]

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

    # PUT "/productions/:id"
    def update
        production = Production.find(params[:id])
        production.update!(production_params)
        render json: production, status: :created
    end

    # DELETE "/productions/:id"
    def destroy
        production = Production.find(params[:id])
        production.destroy
        head :no_content
    end

    private

    def production_params
        params.permit(:title, :genre, :description, :budget, :image, :director, :ongoing)
    end
end

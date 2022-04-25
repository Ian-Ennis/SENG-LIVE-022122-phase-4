class ProductionsController < ApplicationController
    
    # "/productions"
    def index 
        render json: Production.all
    end 

    # "/productions/:id"
    def show
        # byebug
        production = Production.find(params[:id])
        render json: production, include: :production_roles
    end
end

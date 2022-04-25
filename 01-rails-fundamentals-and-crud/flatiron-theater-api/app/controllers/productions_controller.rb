class ProductionsController < ApplicationController
    def index 
        render json: Production.all
    end 

    def show
        # byebug
        production = Production.find(params[:id])
        render json: production, include: :production_roles
    end 
end

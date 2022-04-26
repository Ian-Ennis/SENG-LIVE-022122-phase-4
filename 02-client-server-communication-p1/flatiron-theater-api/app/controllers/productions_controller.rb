class ProductionsController < ApplicationController
    
    # "/productions"
    def index 
        render json: Production.all
    end 

    # "/productions/:id"
    def show
        production = Production.find(params[:id])
        render json: production, include: :production_roles
    end

    # GROUP ACTIVITY #1
    def create
        # Add Code to Check Whether Processable Entity
        
        # If Yes, Return New Production in JSON Format With Status of Created

        # If No, Return Errors With Status of Unprocessable Entity
    end

    private

    # GROUP ACTIVITY #1
    def production_params
        # Add Strong Params for Each New Production
    end
end

class ProductionsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    # GET "/productions"
    def index 
        render json: Production.all
    end 

    # GET "/productions/:id"
    def show
        # production = Production.find("3") => ActiveRecord::RecordNotFound Exception
        # byebug
        
        # "Automagically"
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
        production = Production.find(params[:id])

        # If Found, Update / Render Production With Created Status
        production.update!(production_params)
        render json: production, status: :created
    end

    # DELETE "/productions/:id"
    def destroy
        # Find Production via Params (id)
        production = Production.find(params[:id])

        # If Found, Destroy Production
        production.destroy

        # Render 204 Status Code (No Content) / Send No Content in Response 
        head :no_content

        # render json: production
    end

    private

    def production_params
        params.permit(:title, :genre, :description, :budget, :image, :director, :ongoing)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

    def render_not_found_response(invalid)
        render json: { errors: invalid }, status: :not_found
    end
end

class ProductionRolesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

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

    # GROUP ACTIVITY => Add Update / Destroy Actions

    # PUT "/production_roles/:id"
    def update
        # Find Production Role via Params (id)
        production_role = ProductionRole.find(params[:id])

        # If Found, Update / Render Production Role With Created Status
        production_role.update!(production_role_params)
        render json: production_role, status: :created
    end

    # DELETE "/production_roles/:id"
    def destroy
        # Find Production Role via Params (id)
        production_role = ProductionRole.find(params[:id])

        # If Found, Destroy Production Role
        production_role.destroy

        # Render 204 Status Code (No Content) / Send No Content in Response 
        head :no_content

        # render json: production_role
    end

    private

    def production_role_params
        params.permit(:role, :understudy, :production_id)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

    def render_not_found_response(invalid)
        render json: { errors: invalid }, status: :not_found
    end
end

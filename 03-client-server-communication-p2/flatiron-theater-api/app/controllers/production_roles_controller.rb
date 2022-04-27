class ProductionRolesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

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

        # If Found, Render Production Role With Created Status

            # Update Production Role with production_role_params

            # If Errors, Raise Exception + Render Errors in JSON Format w/ Unprocessable Entity Status

        # If Not Found, Raise Exception + Render Errors in JSON Format w/ Not Found Status
    end

    # DELETE "/production_roles/:id"
    def destroy
        # Find Production Role via Params (id)

        # If Found, Destroy Production Role

            # Render 204 Status Code (No Content) / Send No Content in Response 

        # If Not Found, Raise Exception + Render Errors in JSON Format w/ Not Found Status
    end

    private

    def production_role_params
        params.permit(:role, :understudy, :production_id)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
end

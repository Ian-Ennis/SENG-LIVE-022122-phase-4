class TicketsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


    # GET "/tickets"
    def index 
        render json: Ticket.all
    end 

    # GET "/tickets/:id"
    def show
        ticket = Ticket.find(params[:id])
        render json: ticket, include: [:production, :user]
    end 

    # POST "/tickets"
    def create
        ticket = Ticket.create!(ticket_params)
        render json: ticket, status: :created
    end

    # GROUP ACTIVITY => Add Update / Destroy Actions

    # PUT "/tickets/:id"
    def update
        # Find Ticket via Params (id)
        ticket = Ticket.find(params[:id])

        # If Found, Update / Render Production Role With Created Status
        ticket.update!(ticket_params)
        render json: ticket, status: :created
    end

    # DELETE "/tickets/:id"
    def destroy
        # Find Ticket via Params (id)
        ticket = Ticket.find(params[:id])

        # If Found, Destroy Ticket
        ticket.destroy

        # Render 204 Status Code (No Content) / Send No Content in Response 
        head :no_content

        # render json: ticket
    end

    private

    def ticket_params
        params.permit(:price, :user_id, :production_id)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

    def render_not_found_response(invalid)
        render json: { errors: invalid }, status: :not_found
    end
end
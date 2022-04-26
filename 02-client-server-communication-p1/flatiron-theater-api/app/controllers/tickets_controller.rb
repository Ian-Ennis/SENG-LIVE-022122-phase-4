class TicketsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response


    # "/tickets"
    def index 
        render json: Ticket.all
    end 

    # "/tickets/:id"
    def show
        ticket = Ticket.find(params[:id])
        render json: ticket, include: [:production, :user]
    end 

    # GROUP ACTIVITY #1
    def create

        ticket = Ticket.create!(ticket_params)
        
        # Add Code to Check Whether Processable Entity

        render json: ticket, status: :created

        # If Yes, Return New Production in JSON Format With Status of Created
    end

    private

    # GROUP ACTIVITY #1
    def ticket_params
        # Add Strong Params for Each New Ticket
        params.permit(:price, :user_id, :production_id)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
end
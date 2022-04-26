class TicketsController < ApplicationController
    
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
        # Add Code to Check Whether Processable Entity
        
        # If Yes, Return New Ticket in JSON Format With Status of Created

        # If No, Return Errors With Status of Unprocessable Entity
    end

    private

    # GROUP ACTIVITY #1
    def ticket_params
        # Add Strong Params for Each New Ticket
    end
end
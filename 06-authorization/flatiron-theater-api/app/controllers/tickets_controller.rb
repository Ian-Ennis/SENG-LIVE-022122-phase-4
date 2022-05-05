class TicketsController < ApplicationController

    # before_action :is_admin, only: [:create, :destroy, :update]

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

    # PUT "/tickets/:id"
    def update
        ticket = Ticket.find(params[:id])
        ticket.update!(ticket_params)
        render json: ticket, status: :created
    end

    # DELETE "/tickets/:id"
    def destroy
        ticket = Ticket.find(params[:id])
        ticket.destroy
        head :no_content
    end

    private

    def ticket_params
        params.permit(:price, :user_id, :production)
    end
end
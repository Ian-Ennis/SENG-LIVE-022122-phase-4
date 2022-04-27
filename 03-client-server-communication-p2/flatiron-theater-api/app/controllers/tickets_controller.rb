class TicketsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response


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

        # If Found, Render Ticket With Created Status

            # Update Ticket with ticket_params

            # If Errors, Raise Exception + Render Errors in JSON Format w/ Unprocessable Entity Status

        # If Not Found, Raise Exception + Render Errors in JSON Format w/ Not Found Status
    end

    # DELETE "/tickets/:id"
    def destroy
        # Find Ticket via Params (id)

        # If Found, Destroy Ticket

            # Render 204 Status Code (No Content) / Send No Content in Response 

        # If Not Found, Raise Exception + Render Errors in JSON Format w/ Not Found Status
    end

    private

    def ticket_params
        params.permit(:price, :user_id, :production_id)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
end
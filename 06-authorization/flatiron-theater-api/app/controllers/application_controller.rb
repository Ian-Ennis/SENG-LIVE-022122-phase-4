class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
    include ActionController::Cookies
    
    # Group Activity => Add Method (current_user) To Confirm Current User via Session

    # Group Activity => Add Method (authorize_user)

        # - Return JSON error message of "Not Authorized" unless current_user is 'true' (authorized).  

        # - Add 'before_action' for authorize_user

    # Group Activity => Add Method (is_admin)

        # - Return JSON error message of "Not Authorized" unless current_user.admin is 'true'

    private

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

    def render_not_found_response(invalid)
        render json: { errors: invalid }, status: :not_found
    end
end
class SessionsController < ApplicationController
    # Group Activity => Set 'authorize_user' to Skip Login Action

    def login
        user = User.find_by(name:params[:username])
        
        if user&.authenticate(params[:password])

            # Group Activity => 
                # - Set Session's 'current_user' to User's ID
                # - Set Session's 'login_attempts' to 0
            
            render json: user, status: :ok
        else

            # Group Activity =>
                # - Set Session's 'login_attempts' to 0 if Undefined / Falsey
                # - Increment Session's 'login_attempts' by 1
            
            render json:{error:"Invalid Password and/or Username"},  status: :unauthorized
        end
    end 

    def logout
        session.delete :current_user
    end 
end

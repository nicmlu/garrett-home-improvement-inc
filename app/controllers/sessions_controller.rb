class SessionsController < ApplicationController
    def home
    end 
   
    def create
      client = Client.find_by(email: client_params[:email])
      if client && client.authenticate(client_params[:password])
          session[:client_id] = client.id
          redirect_to client_path(client)
      else 
          flash[:message] = "Incorrect login information. Please try again."
          redirect_to login_path
      end 
    end 

     def destroy
        session.clear 
        redirect_to root_path
    end 


    private
    
    def user_params
        params.require(:user).permit(:email, :password)
    end

end 

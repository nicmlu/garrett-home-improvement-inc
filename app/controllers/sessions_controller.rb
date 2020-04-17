class SessionsController < ApplicationController
    def home
    end 
   
   def create 
        @client = Client.find_by(email:params[:client][:email])
        if @client && @client.authenticate(params[:client][:password])
            session[:client_id] = @client.id
            #binding.pry
            redirect_to client_path(@client)
        else 
            flash[:message] = "Incorrect login info, please try again"
            redirect_to login_path
        end 
    end 

    def facebook 
    end 

     def destroy
        session.clear 
        redirect_to root_path
    end 


    private
    
    def client_params
        params.require(:client).permit(:email, :password)
    end

    def auth
    request.env['omniauth.auth']
    end

end 

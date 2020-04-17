class ClientsController < ApplicationController
    def index
    end
 
    def new 
        @client = Client.new
    end 
 
    def create 
        @client = Client.new(client_params)
        if @client.save 
            session[:client_id] = @client.id
            redirect_to client_path(@client)
        else 
            flash[:message] = "Invalid registration info, please try again"
            redirect_to signup_path 
        end 
    end

    def show 
        @client = Client.find_by_id(params[:id])
    end 

    private

    def client_params
        params.require(:client).permit(:first_name, :last_name, :password, :phone, :email)
    end
end 
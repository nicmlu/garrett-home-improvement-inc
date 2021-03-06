class SessionsController < ApplicationController
    def home
      if is_logged_in? 
        redirect_to client_path(current_client)
      else
        render :home
      end
      
    end 

    def new
    end 
   
   def create 
    if auth
      @client = Client.find_or_create_by(email: auth['info']['email'])
        @client.first_name = auth["info"]["first_name"]
        @client.last_name = auth["info"]["last_name"]
        @client.password = SecureRandom.hex 
          if @client.save
            session[:client_id] = @client.id
            redirect_to client_path(@client)
            else
                redirect_to root_path
            end
          else
            @client = Client.find_by(email: params[:email])
            if @client && @client.authenticate(params[:email])
                session[:client_id] = @client.id
                redirect_to client_path(@client)           
            else
                redirect_to login_path, notice: "Please enter correct login information."
            end
          end
        # @client = Client.find_by(email: params[:user][:email])
        # if @client && @client.authenticate(params[:user][:password])
        #     session[:client_id] = @client.id
        #     redirect_to client_path(@client)
        # else 
        #     flash[:alert] = "Incorrect login info, please try again"
        #     redirect_to login_path
        # end 
    end 

    # def facebook
    #     @client = Client.find_or_create_by(email: auth["info"]["email"]) do |client|
    #       client.first_name = auth["info"]["first_name"]
    #       client.last_name = auth["info"]["last_name"]
    #       client.password = SecureRandom.hex    
    #   end
    #   if @client.save
    #     session[:client_id] = @client.id
    #     redirect_to client_path(@client)
    #   else
    #     redirect_to login_path
    #   end 
    # end 

    # def google
    #     @client = Client.find_or_create_by(email: auth["info"]["email"]) do |client|
    #       client.first_name = auth["info"]["first_name"]
    #       client.last_name = auth["info"]["last_name"]
    #       client.password = SecureRandom.hex    
    #   end
    #   if @client.save
    #     session[:client_id] = @client.id
    #     binding.pry
    #     redirect_to client_path(@client)
    #   else
    #     redirect_to login_path
    #   end 
    # end 

     def destroy
        session.clear 
        redirect_to root_path
    end 


    private

    def auth
    request.env['omniauth.auth']
    end

end 

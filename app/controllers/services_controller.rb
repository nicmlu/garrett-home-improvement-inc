class ServicesController < ApplicationController
    # before_action :login_required
    # before_action :current_client 

    def index
        @services = Service.all
    end 

    def new
        # binding.pry
        @service = Service.new 
    end

    def create
        @service = Service.new(service_params)
        if @service.save 
            redirect_to service_path(@service)
        else 
            render :new 
        end 
    end 

    def show
        @service = Service.find_by_id(params[:id])
    end 

    def edit
        @service = Service.find(params[:id])
    end 

    def update 
        @service = Service.find(params[:id])
        @service.update(service)
        redirect_to service_path(@service)
    end 

    def destroy 
        Service.find(params[:id]).destroy
        redirect_to client_path(current_client)
    end 

    private

    def service_params
        params.require(:service).permit(:name, :description)
    end 
end 
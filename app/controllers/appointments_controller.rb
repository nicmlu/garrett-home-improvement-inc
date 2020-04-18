class AppointmentsController < ApplicationController

    def new
        @appointment = Appointment.new(client_id: params[:client_id]) 
    end 

    def show
        @appointment = Appointment.find(params[:id])
    end 

    def create
    end 

    private

    

end 
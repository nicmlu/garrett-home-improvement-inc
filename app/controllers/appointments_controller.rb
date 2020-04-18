class AppointmentsController < ApplicationController

    def new
        @appointment = Appointment.new(client_id: params[:client_id]) 
    end 

end 
class AppointmentsController < ApplicationController
    before_action :login_required

    def new
        @appointment = Appointment.new(client_id: params[:client_id]) 
    end 

    def show
        @appointment = Appointment.find(params[:id])
    end 

    def create
        @appointment = current_client.appointments.build(appointment_params)
        if @appointment.save
           redirect_to appointment_path(@appointment)
        else 
          flash[:message] = "Appointment was not booked! Please try again."
          render :new 
        end
    end 

    private

    def appointment_params
        params.require(:appointment).permit(:date, :time, :budget, :notes, :client_id, :service_id, before_pictures: [])
    end 



end 
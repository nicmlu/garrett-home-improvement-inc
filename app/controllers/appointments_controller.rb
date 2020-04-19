class AppointmentsController < ApplicationController
    before_action :login_required
    before_action :current_client

    def new
        @appointment = Appointment.new(client_id: params[:client_id]) 
    end 

    def show
        @appointment = Appointment.find(params[:id])
        @review = Review.find_by(appointment_id: @appointment.id)
    end 

    def create
        @appointment = current_client.appointments.build(appointment_params)
        if @appointment.save
           render :show
        else 
          flash[:message] = "Appointment was not booked! Please try again."
          render :new 
        end
    end 

    def edit
        @appointment = Appointment.find(params[:id])
    end 

    def update 
        @appointment = Appointment.find(params[:id])
        @appointment.update(appointment_params)
        redirect_to client_appointment_path(current_client)
    end 

    def destroy 
        Appointment.find(params[:id]).destroy
        redirect_to client_path(current_client)
    end 

    private

    def appointment_params
        params.require(:appointment).permit(:name, :date, :time, :budget, :notes, :client_id, :service_id, before_pictures: [])
    end 



end 
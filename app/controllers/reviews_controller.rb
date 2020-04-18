class ReviewsController < ApplicationController
    before_action :login_required
    before_action :current_client

    def new
        @review = Review.new(client_id: params[:client_id], service_id: params[service_id]) 
    end 

    def show
        @review = Review.find(params[:id])
    end 

    def create
        if params[:appointment_id] && @appointment = Appointment.find_by_id(params[:appointment_id])
         @review = @appointment.reviews.build(review_params)
         @service_id = @appointment.service_id
       else
         flash[:message] = "Appointment does not exist! Please try again."
         @error = "That appointment doesn't exist" if params[:appointment_id]
         redirect_to client_path(current_user)
       end
    end 

    def edit
        @review = Review.find(params[:id])
    end 

    def update 
        @review = Review.find(params[:id])
        @review.update(review)
        redirect_to client_appointment_path(current_client, params[:appointment_id])
    end 

    def destroy 
        Review.find(params[:id]).destroy
        redirect_to client_path(current_user)
    end 

    private

    def review_params
        params.require(:review).permit(:rating, :comment, :client_id, :notes, :client_id, :service_id, :appointment_id, :after_pictures)
    end 



end 
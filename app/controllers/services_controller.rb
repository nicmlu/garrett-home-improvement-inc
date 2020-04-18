class ReviewsController < ApplicationController
    before_action :login_required
    before_action :current_client

    def new
        # binding.pry
        @review = Review.new(new_review_params) 
    end 

    def index
        @reviews = current_client.reviews
    end 

    def show
        @review = Review.find_by_id(params[:id])
        @appointment = Appointment.find_by_id(@review.appointment_id)
    end 

    def create
      @review = current_client.reviews.build(review_params)
       if @review.save
         redirect_to appointment_path(review_params[:appointment_id])
       else
          flash[:message] = "We're Sorry... your review was not saved. Please try again."
          render :new 
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
        redirect_to client_path(current_client)
    end 

    private

    def new_review_params
        params.permit(:appointment_id)
    end 

    def review_params
        params.require(:review).permit(:rating, :comment, :notes, :client_id, :service_id, :appointment_id, :after_pictures)
    end 
end 
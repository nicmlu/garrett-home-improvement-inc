class Appointment < ApplicationRecord
    belongs_to :client
    belongs_to :service 
    has_many_attached :images

    validates_presence_of :date, :message => “Please select your desired appointment date.”
    validates_presence_of :time, :message => “Please select your desired appointment time.”
    validates_presence_of :budget, :message => “Please enter your project budget amount.”
end

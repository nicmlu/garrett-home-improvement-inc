class Appointment < ApplicationRecord
    belongs_to :client
    belongs_to :service 
    has_many_attached :appointment_images

    validates :time, :date, :budget, presence: true
end

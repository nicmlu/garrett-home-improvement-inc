class Appointment < ApplicationRecord
    belongs_to :client
    belongs_to :service 
    has_many_attached :before_pictures

    validates :name, :time, :date, :budget, presence: true
end

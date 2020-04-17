class Review < ApplicationRecord
    belongs_to :client
    belongs_to :appointment
    belongs_to :service 
    has_many_attached :images

    validates_presence_of :rating, :message => “Please rate your service experience.”
    validates_presence_of :comment, :message => “Please comment on your service experience.”
end

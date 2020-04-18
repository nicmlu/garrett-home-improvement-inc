class Review < ApplicationRecord
    belongs_to :client
    belongs_to :appointment
    belongs_to :service 
    has_many_attached :after_pictures

    validates :rating, :comment, presence: true
end

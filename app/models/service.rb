class Service < ApplicationRecord
    has_many :appointments 
    has_many :clients, through: :appointments 
    has_many_attached :images

end

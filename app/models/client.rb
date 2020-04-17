class Client < ApplicationRecord
    has_secure_password 

    has_many :appointments 
    has_many :reviews 
    has_many :services, through: :appointments
    has_one_attached :image

    validates_presence_of :first_name, :last_name
    validates_format_of :phone, :with => /[0-9]{3}-[0-9]{3}-[0-9]{4}/, :message => “Phone numbers must be in xxx-xxx-xxxx format.”
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end

class User < ApplicationRecord
    has_many :attendances
    has_many :attended_event , through: :attendances, dependent: :destroy
    
end

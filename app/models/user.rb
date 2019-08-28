# frozen_string_literal: true

class User < ApplicationRecord
  scope :not_invited_this_event, ->(ids) { where("User_id in ARRAY[?]::integer[]", ids) }

  User.joins(:pets).where("pets.name != 'fluffy'")


  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 2 }


  has_many :attendances
  has_many :events, through: :attendances
  has_many :events
end

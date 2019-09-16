class User < ApplicationRecord
  scope :not_invited_this_event, ->(ids) { where('User_id in ARRAY[?]::integer[]', ids) }
  scope :user_upcoming_event, -> { Event.where('date > ?', DateTime.now) }
  scope :user_past_event, -> { Event.where('date < ?', DateTime.now) }

  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true, length: { minimum: 8 }

  has_many :attendances
  has_many :events, through: :attendances
  has_many :events
end

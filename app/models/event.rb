class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: 'user_id'

  has_many :attendances
  has_many :attendees ,through: :attendances, source: :attendees

  scope :upcoming, -> {where('date > ?',DateTime.now).order(date: :asc)}
  scope :past, -> {where('date < ?',DateTime.now).order(date: :asc)}
end

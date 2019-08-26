class Event < ApplicationRecord
  has_many :attendances
  has_many :attendees ,through: :attendances
  scope :upcoming_event, -> {where('date > ?',DateTime.now)}
  scope :previous_event, -> {where('date < ?',DateTime.now)}
end

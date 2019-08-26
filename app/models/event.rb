class Event < ApplicationRecord
  has_many :attendances
  has_many :attendees ,through: :attendances
  scope :upcoming, -> {where('date > ?',DateTime.now)}
  scope :past, -> {where('date < ?',DateTime.now)}
end

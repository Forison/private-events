# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :user

  validates :date, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  scope :past, ->(time) { where("date < ?", time) }
  scope :upcoming, ->(time) { where("date > ?", time) }



end

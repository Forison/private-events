# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :user

  validates :date, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  scope :past, -> { where('date < ?', DateTime.now).order(date: :asc) }
  scope :upcoming, -> { where('date > ?', DateTime.now).order(date: :desc) }
end

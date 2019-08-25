# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :user
end

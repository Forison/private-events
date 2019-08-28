# frozen_string_literal: true

class Attendance < ApplicationRecord

  scope :invited, -> { where(invitation: true) }
  scope :not_invited, -> { where(invitation: nil) }


  belongs_to :event
  belongs_to :user
end

# frozen_string_literal: true

class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :event do |t|
      t.string :description
      t.timestamps
    end

    create_table :user do |t|
      t.string :name
      t.timestamps
    end

    create_table :attendances do |t|
      t.belongs_to :user
      t.belongs_to :event
      t.datetime :event_date
      t.timestamps
    end
  end
end

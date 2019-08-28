class AddNewColumnToAttendances < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :invitation, :boolean
    add_column :attendances, :invited_by, :integer
  end
end

class AddNewColumnToAttendances < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :invitation_accepted, :boolean
  end
end

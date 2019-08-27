class AddSendInviteToAttendances < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :send_invite, :integer, array:true, default: []
  end
end

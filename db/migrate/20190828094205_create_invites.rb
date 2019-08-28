class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.integer :invite
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end

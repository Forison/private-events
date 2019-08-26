class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :description
      t.datetime :date

      t.timestamps
    end
    # add_index :events, [:user_id, :created_at]
  end
end

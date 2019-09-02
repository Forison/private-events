class AddNametoEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :name, :integer
  end
end

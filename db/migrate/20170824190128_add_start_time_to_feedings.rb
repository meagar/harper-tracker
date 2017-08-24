class AddStartTimeToFeedings < ActiveRecord::Migration[5.1]
  def change
    add_column :feedings, :start_time, :timestamp, null: false
  end
end

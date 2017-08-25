class AddChangeTimeToChangins < ActiveRecord::Migration[5.1]
  def change
    add_column :changings, :change_time, :timestamp, null: false
  end
end

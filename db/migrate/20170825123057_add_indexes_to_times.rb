class AddIndexesToTimes < ActiveRecord::Migration[5.1]
  def change
    add_index :feedings, :start_time
    add_index :changings, :change_time
    add_index :weigh_ins, :weigh_time
  end
end

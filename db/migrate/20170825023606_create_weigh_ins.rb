class CreateWeighIns < ActiveRecord::Migration[5.1]
  def change
    create_table :weigh_ins do |t|
      t.integer :weight, null: false
      t.timestamp :weigh_time, null: false
      t.text :notes
      t.timestamps
    end
  end
end

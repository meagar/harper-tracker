class CreatePumpings < ActiveRecord::Migration[5.1]
  def change
    create_table :pumpings do |t|
      t.integer :left, null: false
      t.integer :right, null: false
      t.timestamp :pump_time, null: false
      t.text :notes
      t.timestamps
    end
  end
end

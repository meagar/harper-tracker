class CreateChangings < ActiveRecord::Migration[5.1]
  def change
    create_table :changings do |t|
      t.integer :poop
      t.integer :poop_type
      t.integer :pee
      t.text :notes

      t.timestamps
    end
  end
end

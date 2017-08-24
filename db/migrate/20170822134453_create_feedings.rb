class CreateFeedings < ActiveRecord::Migration[5.1]
  def change
    create_table :feedings do |t|
      t.integer :amount
      t.boolean :formula
      t.boolean :milk
      t.text :notes

      t.timestamps
    end
  end
end

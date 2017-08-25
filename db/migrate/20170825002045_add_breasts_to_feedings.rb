class AddBreastsToFeedings < ActiveRecord::Migration[5.1]
  def change
    add_column :feedings, :left_breast, :integer
    add_column :feedings, :right_breast, :integer

    Feeding.update_all('left_breast = 0, right_breast = 0');

    change_column_null :feedings, :left_breast, false
    change_column_null :feedings, :right_breast, false
  end
end

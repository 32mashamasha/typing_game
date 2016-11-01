class ChangeColumnToGame < ActiveRecord::Migration[5.0]
  def up
    change_column :games, :user_id, :integer, null: false
  end

  def down
    change_column :games, :user_id, :integer
  end
end

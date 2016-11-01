class AddColumnToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :letter_count, :integer
  end
end

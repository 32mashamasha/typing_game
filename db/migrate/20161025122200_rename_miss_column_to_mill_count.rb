class RenameMissColumnToMillCount < ActiveRecord::Migration[5.0]
  def change
  	rename_column :games, :miss, :miss_count
  end
end

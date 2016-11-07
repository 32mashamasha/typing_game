class AddDescriptionToWords < ActiveRecord::Migration[5.0]
  def change
    add_column :words, :description, :string
  end
end

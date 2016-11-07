# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

Word.delete_all

CSV.foreach('db/drink.csv') do |row|
  Word.create(:description => row[0], :text => row[1], :category_id => 1)
end

CSV.foreach('db/fruit.csv') do |row|
  Word.create(:description => row[0], :text => row[1], :category_id => 2)
end

CSV.foreach('db/vegetable.csv') do |row|
  Word.create(:description => row[0], :text => row[1], :category_id => 3)
end

CSV.foreach('db/meal.csv') do |row|
  Word.create(:description => row[0], :text => row[1], :category_id => 4)
end

CSV.foreach('db/shokuzai.csv') do |row|
  Word.create(:description => row[0], :text => row[1], :category_id => 5)
end

if Category.all.count == 0
  Category.create(id: 1, name: "飲み物")
  Category.create(id: 2, name: "果物")
  Category.create(id: 3, name: "野菜")
  Category.create(id: 4, name: "料理")
  Category.create(id: 5, name: "食材")
end
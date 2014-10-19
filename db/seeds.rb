# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = [
  "Ad Hoc",
  "Backtracking",
  "Complete Search",
  "Dynamic Programming",
  "Graphs",
  "Greedy",
  "Hashes",
  "Search",
  "Simulation",
  "Sorting",
]

categories.each do |category_name|
  Category.where(name: category_name).first_or_create
end

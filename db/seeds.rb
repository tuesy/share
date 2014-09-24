# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# TODO: create a rake task to dynamically update categories

Category.destroy_all
%w(DK2\ Compatible Full\ Game Experience Tech\ Demo Pre-Release Official\ Mod).each do |x|
  c = Category.new
  c.title = x
  c.save!
end

Genre.destroy_all
%w(Action/Adventure Casual Educational Exploration Fighting Horror Puzzle Racing RPG Shooter
  Simulation Sports Strategy).each do |x|
  g = Genre.new
  g.title = x
  g.save!
end

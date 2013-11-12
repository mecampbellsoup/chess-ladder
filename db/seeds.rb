# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Player.create([
                {:name => "Matt", :ranking => 7},
                {:name => "Patches", :ranking => 5},
                {:name => "Sam Owens", :ranking => 3},
                {:name => "Creee", :ranking => 2},
                {:name => "Spangler", :ranking => 1},
                {:name => "James", :ranking => 6},
                {:name => "Logan", :ranking => 8},
                {:name => "Scott", :ranking => 4}
              ])

Challenge.create([
                  {:winner_id => 8, :loser_id => 1},
                  {:winner_id => 7, :loser_id => 2},
                  {:winner_id => 6,", :loser_id => 3},
                  {:winner_id => 5, :loser_id => 4},
                 ])

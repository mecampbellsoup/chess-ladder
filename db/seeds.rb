# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Player.create([
  
  { :name => "Matt",      :ranking => 7, :password => 'flatiron', :password_confirmation => 'flatiron', :email => "matthew.campbell@flatironschool.com" },
  { :name => "Patrick",   :ranking => 5, :password => 'flatiron', :password_confirmation => 'flatiron', :email => "patrick.janson@flatironschool.com" },
  { :name => "Sam Owens", :ranking => 3, :password => 'flatiron', :password_confirmation => 'flatiron', :email => "samuel.owens@flatironschool.com" },
  { :name => "Chris Lee", :ranking => 2, :password => 'flatiron', :password_confirmation => 'flatiron', :email => "christopher.lee@flatironschool.com" },
  { :name => "Spangler",  :ranking => 1, :password => 'flatiron', :password_confirmation => 'flatiron', :email => "michael.spangler@flatironschool.com" },
  { :name => "James",     :ranking => 6, :password => 'flatiron', :password_confirmation => 'flatiron', :email => "james.tong@flatironschool.com" },
  { :name => "Logan",     :ranking => 8, :password => 'flatiron', :password_confirmation => 'flatiron', :email => "logan.hasson@flatironschool.com" },
  { :name => "Scott",     :ranking => 4, :password => 'flatiron', :password_confirmation => 'flatiron', :email => "scott.luptowski@flatironschool.com" }

])
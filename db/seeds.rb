# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

p = Person.create(name:"Chaim", password:"blowf!sh", password_confirmation: "blowf!sh" )
p.admin = true
Person.create( name:"Adin", password:"bluefish", password_confirmation: "bluefish" )
Person.create( name:"Elianna", password:"bluefish", password_confirmation: "bluefish" )
Person.create( name:"Yona Gil", password:"bluefish", password_confirmation: "bluefish" )
Person.create( name:"Calanit", password:"bluefish", password_confirmation: "bluefish" )
Person.create( name:"Ariella", password:"bluefish", password_confirmation: "bluefish" )

Activity.create(:name => "Empty dishwasher", :category => "chore", :points => 5)
Activity.create(:name => "Sports (1 hour)", :category => "physical", :points => 8)
Activity.create(:name => "Reading (English) (1 hour)", :category => "enrichment", :points => 4)
Activity.create(:name => "Paper recyclng", :category => "chores", :points => 2)
Activity.create(:name => "Take out trash", :category => "chore", :points => 4)
Activity.create(:name => "Bottle recycling", :category => "chores", :points => 3)
Activity.create(:name => "Play a sport (1 hour)", :category => "physical", :points => 5)
Activity.create(:name => "Exercise (first 5 min)", :category => "physical", :points => 2)
Activity.create(:name => "Wet recycling", :category => "chore", :points => 4)
Activity.create(:name => "Load dishwasher", :category => "chore", :points => 6)

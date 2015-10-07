# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

poak = Teacher.create!(name: "Professor Oak", email: "poak@example.com", password: "hunter2")

ash = Student.create!(name: "Ash Ketchum", email: "ak@example.com", password: "pikachu")

delia = Parent.create!(name: "Delia Ketchum", email: "dk@example.com", password: "poak")

poak.students << ash

ash.parents << delia

poak.save
ash.save

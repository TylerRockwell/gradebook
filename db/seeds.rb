# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

poak = Teacher.create!(name: "Professor Oak", email: "poak@example.com", password: "hunter2")

ash = Student.create!(name: "Ash Ketchum", email: "ak@example.com", password: "pikachu")
Student.create!(name: "Gary Oak", email: "goak@example.com", password: "jerk")
delia = Parent.create!(name: "Delia Ketchum", email: "dk@example.com", password: "poak")

Grade.create!(assignment_name: "Beating Gary", student_id: 1, grade: "A")
Grade.create!(assignment_name: "Avoiding Team Rocket", student_id: 1, grade: "F")
Grade.create!(assignment_name: "Winning Battles", student_id: 2, grade: "C")

poak.students << ash

ash.parents << delia

poak.save
ash.save

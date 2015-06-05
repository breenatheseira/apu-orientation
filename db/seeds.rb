# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = Admin.create(email: "apuorientation@mail.com", password: "123123123")

student = Student.create(email: "TP000001@apu.edu.my", password: "123123123", username: "TP000001", intake_code: "UCFF1503DS", name: "John")
student = Student.create(email: "TP000002@apu.edu.my", password: "123123123", username: "TP000002", intake_code: "UCD1F1503EE", name: "Sally")
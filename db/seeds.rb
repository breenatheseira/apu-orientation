# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create(email: "apuorientation@mail.com", password: "123123123")

Student.create(email: "TP000001@apu.edu.my", password: "123123123", username: "TP000001", intake_code: "UCFF1503DS", name: "John")
Student.create(email: "TP000002@apu.edu.my", password: "123123123", username: "TP000002", intake_code: "UCD1F1503EE", name: "Sally")

# Foundation Students
Document.create(name: "Student Handbook v5", document_type: "Student Handbook", document_url: "http://res.cloudinary.com/apuorientation/image/upload/v1433491698/q8yxblhza3g5qsowq99q.pdf", intake_code: "UCFF1503")
Document.create(name: "FF1503 Fee Schedule", document_type: "Fee Schedule", document_url: "http://res.cloudinary.com/apuorientation/image/upload/v1433491718/jeaacnv7khqav5ttaxqn.pdf", intake_code: "UCFF1503")
Document.create(name: "FF1503 Orientation Schedule", document_type: "Orientation Schedule", document_url: "http://res.cloudinary.com/apuorientation/image/upload/v1433491734/aapeb8odkuqi6v2qbwqf.pdf", intake_code: "UCFF1503")
Document.create(name: "FF1503 Important Details", document_type: "Important Details", document_url: "http://res.cloudinary.com/apuorientation/image/upload/v1433491718/jeaacnv7khqav5ttaxqn.pdf", intake_code: "UCFF1503")

# Diploma Students
Document.create(name: "Student Handbook v5", document_type: "Student Handbook", document_url: "http://res.cloudinary.com/apuorientation/image/upload/v1433491698/q8yxblhza3g5qsowq99q.pdf", intake_code: "UCD1F1503")
Document.create(name: "D1F1503 Fee Schedule", document_type: "Fee Schedule", document_url: "http://res.cloudinary.com/apuorientation/image/upload/v1433491718/jeaacnv7khqav5ttaxqn.pdf", intake_code: "UCD1F1503")
Document.create(name: "D1F1503 Orientation Schedule", document_type: "Orientation Schedule", document_url: "http://res.cloudinary.com/apuorientation/image/upload/v1433491734/aapeb8odkuqi6v2qbwqf.pdf", intake_code: "UCD1F1503")
Document.create(name: "D1F1503 Important Details", document_type: "Important Details", document_url: "http://res.cloudinary.com/apuorientation/image/upload/v1433491734/aapeb8odkuqi6v2qbwqf.pdf", intake_code: "UCD1F1503")
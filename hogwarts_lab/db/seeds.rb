require_relative('../models/student_record')
require('pry')
# StudentRecord.delete_all()

student1 = StudentRecord.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "age" => 10,
  "house" => "Gryffindor"
  })

  student2 = StudentRecord.new({
    "first_name" => "Rick",
    "last_name" => "Astley",
    "age" => 15,
    "house" => "Hufflepuff"
    })

  house1 = House.new({
    "house_name" => "Gryffindor",
    "house_logo" => "Gryffindor Logo"
    })

  house2 = House.new({
    "house_name" => "Hufflepuff",
    "house_logo" => "Hufflepuff logo"
    })

  student1.save
  student2.save

  house1.save
  house2.save
  binding.pry()

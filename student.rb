require './person'

class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

student1 = Student.new(17, '2-E', 'Kaori', parent_permission: false)
student2 = Student.new(24, '1-A', 'Manuel', parent_permission: true)
puts "Student 1 id: #{student1.id}"
puts "Student 1 name: #{student1.name}"
student1.name = 'Stephania'
puts "Student 1 new name: #{student1.name}"
puts "Student 1 age: #{student1.age}"
puts "Student 1 can use services: #{student1.can_use_services?}"
student1.age = 25
puts "Student 1 new age: #{student1.age}"
puts "Student 1 can use services: #{student1.can_use_services?}"
puts student1.play_hooky
puts "\n"
puts "Student 2 id: #{student2.id}"
puts "Student 2 name: #{student2.name}"
puts "Student 2 age: #{student2.age}"
puts "Student 2 can use services: #{student2.can_use_services?}"
puts student2.play_hooky

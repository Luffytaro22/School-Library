require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'main'

# Outputs for students
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
puts "\n"

# Outputs for teachers
teacher1 = Teacher.new(32, 'Physics')
teacher2 = Teacher.new(50, 'Language', 'Mario')

puts "Teacher 1 id: #{teacher1.id}"
puts "Teacher 1 name: #{teacher1.name}"
puts "Teacher 1 age: #{teacher1.age}"
puts "Can use service: #{teacher1.can_use_services?}"
puts "\n"
puts "Teacher 2 id: #{teacher2.id}"
puts "Teacher 2 name: #{teacher2.name}"
puts "Teacher 2 age: #{teacher2.age}"
puts "Can use service: #{teacher2.can_use_services?}"
puts "\n"

# Decorate person
person = Person.new(22, 'maximilianus')
person.correct_name
puts "Introduced person name: #{person.correct_name}"
capitalized_person = CapitalizeDecorator.new(person)
puts "Capitalized person name: #{capitalized_person.correct_name}"
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts "Trimmed person name: #{capitalized_trimmed_person.correct_name}"

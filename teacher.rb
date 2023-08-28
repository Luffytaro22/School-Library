require './person'

class Teacher < Person
  def initialize(age, specialization, name = 'Unknown')
    super(age, name)
    @specializationi = specialization
  end

  def can_use_services?
    true
  end
end

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

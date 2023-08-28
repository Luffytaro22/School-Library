require './person.rb'

class Teacher < Person
  def initialize(age, specialization, name = "Unknown")
    super(age, name);
    @specializationi = specialization;
  end

  def can_use_services?
    true
  end
end

teacher_1 = Teacher.new(32, 'Physics');
teacher_2 = Teacher.new(50, 'Language', 'Mario');

puts "Teacher 1 id: #{teacher_1.id()}";
puts "Teacher 1 name: #{teacher_1.name()}";
puts "Teacher 1 age: #{teacher_1.age()}";
puts "Can use service: #{teacher_1.can_use_services?}";
puts "\n"
puts "Teacher 2 id: #{teacher_2.id()}";
puts "Teacher 2 name: #{teacher_2.name()}";
puts "Teacher 2 age: #{teacher_2.age()}";
puts "Can use service: #{teacher_2.can_use_services?}";

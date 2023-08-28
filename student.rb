require "./person.rb";

class Student < Person
  def initialize(age, name = "Unknown", parent_permission = true, classroom)
    super(age, name, parent_permission);
    @classroom = classroom;
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

student_1 = Student.new(17,'Kaori', false, "2-E");
student_2 = Student.new(24, "Manuel", true, "1-A");
puts "Student 1 id: #{student_1.id()}";
puts "Student 1 name: #{student_1.name()}";
student_1.name = 'Stephania';
puts "Student 1 new name: #{student_1.name()}";
puts "Student 1 age: #{student_1.age()}";
puts "Student 1 can use services: #{student_1.can_use_services?()}";
student_1.age = 25;
puts "Student 1 new age: #{student_1.age()}";
puts "Student 1 can use services: #{student_1.can_use_services?()}";
puts student_1.play_hooky();
puts "\n"
puts "Student 2 id: #{student_2.id()}";
puts "Student 2 name: #{student_2.name()}";
puts "Student 2 age: #{student_2.age()}";
puts "Student 2 can use services: #{student_2.can_use_services?()}";
puts student_2.play_hooky();

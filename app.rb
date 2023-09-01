require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'classroom'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    @books.each do |book|
      puts "Title: '#{book[:title]}', Author: #{book[:author]}"
    end
  end

  def list_people
    @people.each do |person|
      if person[:role] == "[Teacher]"
        puts "#{person[:role]} ID: #{person[:id]}, Name: #{person[:name]}, Age: #{person[:age]}, Specialization: #{person[:specialization]}"
      else
        puts "#{person[:role]} ID: #{person[:id]}, Name: #{person[:name]}, Age: #{person[:age]}, Classroom: #{person[:classroom]}, Parent Permission: #{person[:permission]}"
      end
    end
  end

  def list_rentals_for_person(person_id)
    person = @people.find { |p| p.id == person_id }
    if person
      rentals_for_person = @rentals.select { |r| r.person == person }
      puts "Rentals for #{person[:name]}:"
      rentals_for_person.each do |rental|
        puts "#{rental.book.title}, Date: #{rental.date}"
      end
    else
      puts "Person with ID #{person_id} not found."
    end
  end

  def create_student(age, classroom, name, permission)
    classroom_name = Classroom.new(classroom)
    student = Student.new(age, classroom_name, name, parent_permission: permission)
    student_input = {
      role: "[Student]",
      id: student.id,
      name: student.name,
      age: student.age,
      classroom: classroom_name.label,
      permission: student.parent_permission
    }
    @people << student_input
  end

  def create_teacher(age, specialization, name)
    teacher = Teacher.new(age, specialization, name)
    teacher_input = {
      role: "[Teacher]",
      id: teacher.id,
      name: teacher.name,
      age: teacher.age,
      specialization: teacher.specialization
    }
    @people << teacher_input
  end

  def create_book(title, author)
    book = Book.new(title, author)
    book_input = {
      title: book.title,
      author: book.author
    }
    @books << book_input
  end

  def list_books_with_index
    puts "Select a book from the following list by number:"
    @books.each_with_index do |book, index|
      puts "#{index}) Title: '#{book[:title]}', Author: #{book[:author]}"
    end
  end

  def list_people_with_index
    puts "Select a person from the following list by number (not id):"
    @people.each_with_index do |person, index|
      if person[:role] == "[Teacher]"
        puts "#{index}) #{person[:role]} ID: #{person[:id]}, Name: #{person[:name]}, Age: #{person[:age]}, Specialization: #{person[:specialization]}"
      else
        puts "#{index}) #{person[:role]} ID: #{person[:id]}, Name: #{person[:name]}, Age: #{person[:age]}, Classroom: #{person[:classroom]}, Parent Permission: #{person[:permission]}"
      end
    end
  end

  def create_rental(date, person_index, book_index)
    person = @people[person_index]
    book = @books[book_index]
    rental = Rental.new(date, person, book)
    puts "#{rental}"
    puts "#{rental.person}"
    puts "#{rental.book}"
    puts "#{rental.date}"
    @rentals << rental
  end
end

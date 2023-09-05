require 'json'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'classroom'

class App
  def initialize
    create_file_if_not_exists("./data/people.json")
    create_file_if_not_exists("./data/books.json")
    create_file_if_not_exists("./data/rentals.json")
    @people = []
    @books = []
    @rentals = []
  end

  def file_exists?(file_path)
    File.exist?(file_path)
  end
  
  def create_file_if_not_exists(file_path)
    unless file_exists?(file_path)
      File.open(file_path, "w") do |file|
      end
    end
  end

  def list_books
    @books.each do |book|
      puts "Title: '#{book[:title]}', Author: #{book[:author]}"
    end
  end

  def list_people
    @people.each do |person|
      if person[:role] == '[Teacher]'
        puts "#{person[:role]} ID: #{person[:id]}, Name: #{person[:name]}, Age: #{person[:age]},
        Specialization: #{person[:specialization]}"
      else
        puts "#{person[:role]} ID: #{person[:id]}, Name: #{person[:name]}, Age: #{person[:age]},
        Classroom: #{person[:classroom]}, Parent Permission: #{person[:permission]}"
      end
    end
  end

  def list_rentals_for_person(person_id)
    filtered_rentals = @rentals.select { |obj| obj[:id] == person_id }
    if filtered_rentals.length.positive?
      filtered_rentals.each do |rental|
        puts "Date: #{rental[:date]}, Book: '#{rental[:title]}' by #{rental[:author]}"
      end
    else
      puts 'No matching ID'
    end
  end

  def create_student(age, classroom, name, permission)
    classroom_name = Classroom.new(classroom)
    student = Student.new(age, classroom_name, name, parent_permission: permission)
    student_input = {
      role: '[Student]',
      id: student.id,
      name: student.name,
      age: student.age,
      classroom: classroom_name.label,
      permission: student.parent_permission
    }
    @people << student_input
    File.write("./data/people.json", JSON.pretty_generate(@people))
  end

  def create_teacher(age, specialization, name)
    teacher = Teacher.new(age, specialization, name)
    teacher_input = {
      role: '[Teacher]',
      id: teacher.id,
      name: teacher.name,
      age: teacher.age,
      specialization: teacher.specialization
    }
    @people << teacher_input
    File.write("./data/people.json", JSON.pretty_generate(@people))
  end

  def create_book(title, author)
    book = Book.new(title, author)
    book_input = {
      title: book.title,
      author: book.author
    }
    @books << book_input
    File.write("./data/books.json", JSON.pretty_generate(@books))
  end

  def list_books_with_index
    puts 'Select a book from the following list by number:'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: '#{book[:title]}', Author: #{book[:author]}"
    end
  end

  def list_people_with_index
    puts 'Select a person from the following list by number (not id):'
    @people.each_with_index do |person, index|
      if person[:role] == '[Teacher]'
        puts "#{index}) #{person[:role]} ID: #{person[:id]}, Name: #{person[:name]}, Age: #{person[:age]},
        Specialization: #{person[:specialization]}"
      else
        puts "#{index}) #{person[:role]} ID: #{person[:id]}, Name: #{person[:name]}, Age: #{person[:age]},
        Classroom: #{person[:classroom]}, Parent Permission: #{person[:permission]}"
      end
    end
  end

  def create_rental(date, person_index, book_index)
    person = @people[person_index]
    book = @books[book_index]
    rental = Rental.new(date, person, book)
    rental_input = {
      id: rental.person[:id],
      title: rental.book[:title],
      author: rental.book[:author],
      date: rental.date
    }
    @rentals << rental_input
    File.write("./data/rentals.json", JSON.pretty_generate(@rentals))
  end
end

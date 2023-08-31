require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def list_books
    @book
  end

  def create_student(age, classroom, name, permission)
    Student.new(age, classroom, name, parent_permission: permission)
  end

  def create_teacher(age, specialization, name)
    Teacher.new(age, specialization, name)
  end

  def create_book(title, author)
    Book.new(title, author)
  end

  def create_rental(date, person, book)
    Rental.new(date, person, book)
  end
end

require_relative 'nameable'
require_relative 'app'

# Base decorator
class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  attr_accessor :nameable

  def correct_name
    @nameable.correct_name
  end
end

# Capitalize Decorator
class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

# Trimmer Decorator
class TrimmerDecorator < Decorator
  def correct_name
    original_name = @nameable.correct_name
    if original_name.length > 10
      original_name[0..9] # Trim the name to maximum 10 characters
    else
      original_name
    end
  end
end

def main
  app = App.new
  loop do
    puts "Please choose an option by enterin a number:"
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a given person id"
    puts "7 - Exit"
    option = gets.chomp
    case option
    when "1"
      puts "Books:"
      app.list_books
    when "2"
      puts "People:"
      app.list_people
    when "3"
      print "Do you want to create a student(1) or a teacher(2)? [Input the number]: "
      get_person = gets.chomp
      if get_person == "1"
        print "Age: "
        age = gets.chomp.to_i
        print "Name: "
        name = gets.chomp
        print "Classroom: "
        classroom = gets.chomp
        print "Has parent permission? [Y/N]: "
        permission = gets.chomp
        if permission == "y"
          permission = true
        else
          permission = false
        end
        app.create_student(age, classroom, name, permission)
        puts "Student created successfully"
      else
        print "Age: "
        age = gets.chomp.to_i
        print "Name: "
        name = gets.chomp
        print "Specialization: "
        specialization = gets.chomp
        app.create_teacher(age, specialization, name)
        puts "Teacher created successfully"
      end
    when "4"
      print "Title: "
      title = gets.chomp
      print "Author: "
      author = gets.chomp
      app.create_book(title, author)
      puts "Book created successfully"
    when "5"
      print "Date: "
      date = gets.chomp
      print "Person name: "
      name = gets.chomp
      print "Book name: "
      book = gets.chomp
      app.create_rental(date, name, book)
      puts "Rental created successfully"
    when "6"
      print "Person ID: "
      id = gets.chomp.to_i
      puts "The rentals for #{id} are:"
      app.list_rentals_for_person(id)
    when "7"
      puts "Thanks for using our system /(^w^)/"
      break
    else
      puts "I don't recognize that option..."
    end
  end
end

main()

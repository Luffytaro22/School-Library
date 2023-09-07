require_relative 'app'

def display_menu
  puts 'Please choose an option by enterin a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def create_person(app)
  print 'Do you want to create a student(1) or a teacher(2)? [Input the number]: '
  get_person = gets.chomp
  print 'Age: '
  age = gets.chomp.to_i
  print 'Name: '
  name = gets.chomp
  if get_person == '1'
    print 'Classroom: '
    classroom = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.downcase
    permission = permission == 'y'
    app.create_student(age, classroom, name, permission)
    puts 'Student created successfully'
  else
    print 'Specialization: '
    specialization = gets.chomp
    app.create_teacher(age, specialization, name)
    puts 'Teacher created successfully'
  end
end

def new_book(app)
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  app.create_book(title, author)
  puts 'Book created successfully'
  puts "\n"
end

def new_rental(app)
  app.list_books_with_index
  index_book = gets.chomp.to_i
  app.list_people_with_index
  index_people = gets.chomp.to_i
  print 'Date: '
  date = gets.chomp
  app.create_rental(date, index_people, index_book)
  puts 'Rental created successfully'
  puts "\n"
end

def display_rentals(app)
  print 'Person ID: '
  id = gets.chomp.to_i
  puts "The rentals for #{id} are:"
  app.list_rentals_for_person(id)
  puts "\n"
end

def display_books(app)
  puts 'Books:'
  app.list_books
  puts "\n"
end

def display_people(app)
  puts 'People:'
  app.list_people
  puts "\n"
end

def main
  app = App.new
  loop do
    display_menu
    option = gets.chomp
    puts "\n"
    case option
    when '1' then display_books(app)
    when '2' then display_people(app)
    when '3' then create_person(app)
    when '4' then new_book(app)
    when '5' then new_rental(app)
    when '6' then display_rentals(app)
    else
      puts 'Thanks for using our system /(^w^)/'
      break
    end
  end
end

main

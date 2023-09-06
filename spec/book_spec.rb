require './book.rb'
require './person.rb'
require './rental.rb'

describe Book do
  context "When testing the Book class"do
    it "Create an instance and test the add_rental method" do
      person1 = Person.new(23, 'Norland')
      book1 = Book.new('Harry Potter', 'J.K Rowling')
      rental1 = book1.add_rental(person1, '2023/09/06')

      expect(book1).to be_instance_of Book
      expect(person1).to be_instance_of Person
      expect(rental1).to be_instance_of Rental
      expect(book1.title).to eql 'Harry Potter'
      expect(book1.author).to eql 'J.K Rowling'
    end
  end
end

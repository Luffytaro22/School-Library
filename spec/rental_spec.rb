require './rental'
require './person'
require './book'

describe Rental do
  context 'When testing Rental class' do
    it 'Create a new rental with a new person and book' do
      person1 = Person.new(45, 'Monica')
      book1 = Book.new('Sunshine', 'Somebody')
      rental1 = Rental.new('2023/11/25', person1, book1)

      expect(rental1).to be_instance_of Rental
      expect(rental1.date).to match '2023/11/25'
      expect(rental1.person).to be_instance_of Person
      expect(rental1.book).to be_instance_of Book
    end
  end
end

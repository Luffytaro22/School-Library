require './book.rb'

describe Book do
  context "When testing the Book class"do
    it "Should create a new instance" do
      book1 = Book.new('Harry Potter', 'J.K Rowling')
      expect(book1).to be_instance_of Book
    end
  end
end

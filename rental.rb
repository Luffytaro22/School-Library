class Rental
  @all = []
  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    person.rentals << self
    book.rentals << self
    @@all << self
  end

  attr_accessor :date, :person, :book

  class << self
    attr_reader :all
  end
end

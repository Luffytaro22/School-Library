class Rental
  @all = []
  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    if person.is_a?(Person)
      person.rentals << self
    end
    if book.is_a?(Book)
      book.rentals << self
    end
  end

  attr_accessor :date, :person, :book

  class << self
    attr_reader :all
  end
end

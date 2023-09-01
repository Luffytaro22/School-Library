class Rental
  @all = []
  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    person.rentals << self if person.is_a?(Person)
    return unless book.is_a?(Book)

    book.rentals << self
  end

  attr_accessor :date, :person, :book

  class << self
    attr_reader :all
  end
end

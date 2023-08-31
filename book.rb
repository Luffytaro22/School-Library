require_relative 'rental'

class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  attr_accessor :title, :author, :rentals

  # has-many relation with Rental
  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end

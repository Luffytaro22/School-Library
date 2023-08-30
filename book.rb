require_relative 'rental'

class Book
  def initialize(title, author)
    @title = title
    @author = author
  end

  attr_accessor :title, :author

  # has-many relation with Rental
  def rentals
    Rental.all.select { |rental| rental.book == self }
  end
end

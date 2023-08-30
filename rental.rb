class Rental
  @@all = []
  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    @@all << self
  end

  attr_accessor :date, :person, :book

  def self.all
    @@all
  end
end

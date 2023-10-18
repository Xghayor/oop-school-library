class Rental
  attr_accessor :date, :book, :person

  def initialize(book, date, person)
    @date = date
    @book = book
    @person = person

    if @book
      @book.rentals << self
    end

    if @person
    person.rentals << self
    end
  end
end

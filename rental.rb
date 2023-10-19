class Rental
  attr_accessor :date, :book, :person_id

  def initialize(book, date, person_id)
    @date = date
    @book = book
    @person_id = person_id

    return unless @book.is_a?(Book)

    @book.rentals << self
  end

  def to_json(*_args)
    {
      'date' => @date,
      'book' => @book,
      'person_id' => @person_id
    }.to_json
  end
end

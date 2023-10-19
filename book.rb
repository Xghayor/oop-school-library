class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    rental = Rental.new(self, date, person)
    @rentals << rental
    rental
  end

  def to_json(*_args)
    {
      'title' => @title,
      'author' => @author,
      'rentals' => @rentals.map(&:to_json)
    }.to_json
  end
end

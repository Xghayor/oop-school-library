require 'rspec'
require_relative '../book'
require_relative '../rental'
require_relative '../person'

describe Book do
  it 'Should create a new book' do
    book = Book.new('Lord of The Rings', 'Tolkien')
    expect(book).to be_an_instance_of(Book)
  end

  it 'Should be add as a Rental when the method "add_rental" is call' do
    book = Book.new('Lord of The Rings', 'Tolkien')
    person = Person.new(22, 'Austin')
    result = book.add_rental(person, '2010/07/01')
    expect(result).to be_an_instance_of(Rental)
  end
end

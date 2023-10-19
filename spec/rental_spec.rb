require 'rspec'
require_relative '../rental'
require_relative '../person'
require_relative '../book'

describe Rental do
  before :each do
    @person = Person.new(22, 'Austin')
    @book = Book.new('Lord of The Rings', 'Tolkien')
  end

  it 'Should instance a Rental object' do
    rental = Rental.new(@book, '2010/05/03', @person)
    expect(rental).to be_an_instance_of(Rental)
  end
end

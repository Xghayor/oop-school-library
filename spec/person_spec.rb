require 'rspec'
require_relative '../person.rb'
require_relative '../rental.rb'
require_relative '../book.rb'

describe Person do
    before :each do
      @person = Person.new(22, 'Austin')
      @book = Book.new('Lord of The Rings', 'Tolkien')
    end

    it 'have created an instance of Person' do
      expect(@person).to be_an_instance_of(Person)
    end

    it 'id should be between 1 and 1000' do
      expect(@person.id).to be_between(1, 1000).inclusive
    end

    it 'def correct_name should return @name' do
      expect(@person.correct_name).to eql('Austin')
    end

    it 'returns true if the person is 18 years old or older' do
      expect(@person.send(:of_age?)).to be true
    end

    it 'def ca_use_services? should return true if has the majority of age or have parent permission' do
      expect(@person.can_use_services?).to be_truthy
    end

    it 'should create a new instance of Rental' do
      expect(@person.add_rental(@book, '2010/05/03')).to be_an_instance_of(Rental)
    end
end
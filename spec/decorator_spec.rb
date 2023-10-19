require 'rspec'
require_relative '../decorator.rb'
require_relative '../person.rb'

describe CapitalizeDecorator do
    context 'Create instance of trimmer and test'
  
    it 'should capitalize first letter and trim the name to 10 chars' do
      person = Person.new(2, 'iamnickoledeon')
      capitalize_person = CapitalizeDecorator.new(person)
      trimmed_person = TrimmerDecorator.new(capitalize_person).correct_name
      expect(trimmed_person).to eq 'Iamnickole'
    end
  end
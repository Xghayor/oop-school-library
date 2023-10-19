require 'rspec'
require_relative '../teacher.rb'

describe Teacher do
    it 'should instance an object of Teacher' do
      teacher = Teacher.new(31, 'Math', 'Richard')
      expect(teacher).to be_an_instance_of(Teacher)
    end

    it 'the teacher should be able to use services' do
      teacher = Teacher.new(27, 'English', 'Nataly')
      expect(teacher.can_use_services?).to eql(true)
    end
end
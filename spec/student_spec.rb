require 'rspec'
require_relative '../student.rb'
require_relative '../classroom.rb'

describe Student do
    before :each do
      @student = Student.new(22, 'Austin')
      @classroom = Classroom.new('Math')
    end

    it 'should add the student inside a classroom' do
      @student.classroom = @classroom
      expect(@classroom.students).to include(@student)
    end
end
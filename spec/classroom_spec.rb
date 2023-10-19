require 'rspec'
require_relative '../student'
require_relative '../classroom'

describe Classroom do
  before :each do
    @student = Student.new(22, 'Austin')
    @classroom = Classroom.new('Math')
  end

  it 'should initialize with a name label' do
    expect(@classroom.label).to eql('Math')
  end

  it 'should push a new student to this classroom' do
    @classroom.add_student(@student)
    students_count = @classroom.instance_variable_get(:@students).length
    expect(students_count).to eq(1)
  end

  it 'returns an empty array by default' do
    expect(@classroom.students).to be_empty
  end

  it 'sets the student classroom to the classroom' do
    @classroom.add_student(@student)
    expect(@student.classroom).to eq(@classroom)
  end
end

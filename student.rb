require './person'

class Student < Person
  attr_reader :classroom, :students

  def initialize(age, name, _parent_permission, classroom = [])
    super(age, name, parent_permission: true)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def to_json(*_args)
    {
      'id' => id,
      'age' => @age,
      'name' => @name,
      'classroom' => @classroom.map(&:to_h)
    }.to_json
  end
end

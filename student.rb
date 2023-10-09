require './person'

class Student < Person
  attr_reader :classroom

  def initialize(id, name = 'Unknown', age = 0, parent_permission: true, classroom: nil)
    super(id, name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end

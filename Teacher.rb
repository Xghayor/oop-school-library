require './Person'

class Teacher < Person
  attr_reader :specialization

  def initialize(id, name = 'Unknown', age = 0, parent_permission: true, specialization: nil)
    super(id, name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

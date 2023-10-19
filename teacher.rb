require_relative 'person'

class Teacher < Person
  def initialize(age, specialization, name = 'Unknown', parent_permission: true, id: nil)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
    @id = id || next_id
  end

  def can_use_services?
    true
  end

  def to_json(*_args)
    { 'name' => @name, 'age' => @age, 'specialization' => @specialization, 'parent_permission' => @parent_permission, 'id' => @id }
  end
end

require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name = 'Unknown', parent_permission: true, id: nil)
    super(age, name, parent_permission: parent_permission)
    @classroom = nil
    @id = id || next_id
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def join_classroom(classroom)
    @classroom = classroom
    classroom.students << self
  end

  def to_json(*_args)
    { 'name' => @name, 'age' => @age, 'id' => @id, 'parent_permission' => @parent_permission,
      'class' => self.class.to_s }
  end
end

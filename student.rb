require_relative 'person'

class Student < Person

  attr_accessor :classroom

  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name)
    @classroom = nil
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def join_classroom(classroom)
    @classroom = classroom
  end

end




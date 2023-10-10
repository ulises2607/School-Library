require './person'

class Student < Person
  def initialize(age, name, classroom)
    super(age, name)
    @classroom = classroom
  end

  attr_writer :name

  def play_hooky
    '¯(ツ)/¯'
  end
end

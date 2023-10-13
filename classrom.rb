class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label, students = [])
    @label = label
    @students = students
  end
end

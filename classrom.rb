require_relative 'student'

class Classroom
  attr_accessor :label

  def initialize(label, students = [])
    @label = label
    @students = students
  end

  def add_student(std)
    if @students.include?(std)
      puts 'The student already belong to this classroom.'
    else
      @students << std
      std.join_classroom(self)
    end
  end

  def student_list
    @students.map(&:name)
  end
end

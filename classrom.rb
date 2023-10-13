require_relative 'student'

class Classroom

    attr_accessor :label

    def initialize(label, students = [])
        @label = label
        @students = students
    end

    def has_many?
        puts @students.length
    end

    def add_student(std)
        if !@students.include?(std)
            @students << std
            std.join_classroom(self)
        else
            puts "The student already belong to this classroom."
        end
    end

    def student_list
        @students.map { |st| st.name}
    end

end

# c1 = Classroom.new("Classroom A")
# puts c1.label

# st1 = Student.new(16, "Ulises")
# st2 = Student.new(23, "Barby")

# c1.add_student(st1)
# c1.add_student(st2)


# puts "Probando agregar de neuvo un estudiante a una clase"

# c1.add_student(st1)

# puts c1.student_list


# puts "ahora verificar si se inserto la classroom en Student class"
# puts "\n"

# puts st1.classroom.label
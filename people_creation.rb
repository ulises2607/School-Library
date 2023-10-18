require_relative 'student'
require_relative 'teacher'
class PeopleCreation
  def create_student(people_list)
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? (Y/N): '
    parent_permission = gets.chomp.upcase
    people_list << if parent_permission == 'Y'
                     Student.new(age, name)
                   else
                     Student.new(age, name, parent_permission: false)
                   end
    puts 'Student added successfully'
  end

  def create_teacher(people_list)
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    people_list << Teacher.new(age, specialization, name)
    puts 'Teacher added successfully'
  end

  def create_person(people_list)
    print 'Do you want to create a Student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp.to_i
    if person_type == 1
      create_student(people_list)
    elsif person_type == 2
      create_teacher(people_list)
    else
      puts 'Invalid option'
    end
  end
end

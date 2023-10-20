require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require 'json'

class PeopleManager
  attr_accessor :people_list

  def initialize
    @people_list = []
    load_people
  end

  def create_student()
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? (Y/N): '
    parent_permission = gets.chomp.upcase
    @people_list << if parent_permission == 'Y'
                      Student.new(age, name)
                    else
                      Student.new(age, name, parent_permission: false)
                    end
    puts 'Student added successfully'
  end

  def create_teacher()
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @people_list << Teacher.new(age, specialization, name)
    puts 'Teacher added successfully'
  end

  def create_person()
    print 'Do you want to create a Student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp.to_i
    if person_type == 1
      create_student
    elsif person_type == 2
      create_teacher
    else
      puts 'Invalid option'
    end
  end

  def save_people
    File.open('people.json', 'w') do |file|
      file.puts JSON.generate(@people_list.map(&:to_json))
    end
  end

  def load_people
    @people_list = []

    return unless File.exist?('people.json') && !File.empty?('people.json')

    catched_data = JSON.parse(File.read('people.json'))

    @people_list = catched_data.map do |person|
      if person['class'] == 'Student'
        Student.new(person['age'], person['name'], parent_permission: person['parent_permission'], id: person['id'])
      elsif person['class'] == 'Teacher'
        Teacher.new(person['age'], person['specialization'], person['name'], id: person['id'])
      end
    end
  end

  def show_people
    if @people_list.empty?
      puts 'No people'
    else
      puts '-----------------'
      puts 'People list:'
      puts '-----------------'
      puts ''
      @people_list.each do |person|
        puts "[#{person.class}] - Name: \"#{person.name},\" ID: #{person.id}, Age: #{person.age}"
      end
    end
    puts ''
    puts 'Press Enter to continue!'
  end
end

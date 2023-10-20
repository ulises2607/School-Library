require_relative 'save_data'
require_relative 'student'
require_relative 'teacher'

data = DataSaver.load_books

# puts ""
# puts data.each { |book| puts book.class }

puts(data.map { |book| book['author'] })

# puts data.map { |book| book['author'] }.uniq
data2 = DataSaver.load_people

puts(data2.map { |person| person['id'] })

puts '...'

puts "Cantidad de elementos: #{data2.length}"

person_test = Student.new(20, 'Juan', parent_permission: true, id: 2)

puts "Person test: #{person_test.to_json}"

teacher_test = Teacher.new(20, 'Math', 'Juan', parent_permission: true, id: 3)

puts "Teacher test: #{teacher_test.to_json}"

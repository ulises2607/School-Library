require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'user_interface'

class App
  attr_accessor :people, :books, :running, :rentals

  def initialize()
    @people = []
    @books = []
    @rentals = []
    @running = true
  end

  def run
    while @running
      UserInterface.print_main_menu
      option = UserInterface.user_input.to_i
      option_choice(option)
    end
  end

  def option_choice(option)
    option_mapping = {
      1 => method(:list_all_books),
      2 => method(:list_all_people),
      3 => method(:create_person),
      4 => method(:create_book),
      5 => method(:create_rental),
      6 => method(:list_rentals),
      7 => method(:exit_application)
    }

    if option_mapping.key?(option)
      option_mapping[option].call
    else
      handle_invalid_option
    end
  end

  def exit_application
    @running = false
  end

  def handle_invalid_option
    puts "\e[31mInvalid option. Please try again\e[0m"
  end

  def print_main_menu()
    puts "\n"
    puts '----------------------------------'
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    puts "\n"
  end

  def create_student()
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.upcase
    @people << if parent_permission == 'Y'
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

    @people << Teacher.new(age, specialization, name)
    puts 'Teacher added successfully'
  end

  # Create a method called create_person that will ask the user for
  # the information required to create a new person and then create it.
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

  # Create a method called create_book that will ask the user for the information required
  # to create a new book and then create it.
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental()
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index} - Title: #{book.title} Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    selected_book = @books[book_index]
    puts 'Select a person from the following list by number (not ID)'
    @people.each_with_index do |person, index|
      puts "#{index} - [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    selected_person = @people[person_index]
    print 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, selected_book, selected_person)
    puts 'Rental created successfully'
  end

  def list_rentals()
    puts 'ID of person: '
    person_id = gets.chomp.to_i
    person_rentals = @rentals.select { |rental| rental.person.id == person_id }
    person_rentals.each do |rental|
      puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}}"
    end
  end

  def list_all_books()
    if @books.length.positive?

      @books.each do |book, _index|
        puts "Title: \"#{book.title}\", Author: #{book.author}"
      end
    else
      puts 'There are no books in the library'
    end
  end

  def list_all_people()
    if @people.length.positive?
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    else
      puts 'There are no people in the library'
    end
  end
end

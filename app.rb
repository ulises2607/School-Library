require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class Library
    attr_accessor :people, :books, :running, :rentals

    def initialize()
        @people = []
        @books = []
        @rentals = []
        @running = true
    end

    # Create a method called create_person that will ask the user for the information required to create a new person and then create it.
    def create_person()
        print  "Do you want to create a Student (1) or a teacher (2)? [Input the number]: "
        person_type = gets.chomp.to_i
        if person_type == 1
            print "Age: "
            age = gets.chomp.to_i
            print "Name: "
            name = gets.chomp
            print "Has parent permission? [Y/N]: "
            parent_permission = gets.chomp.upcase
            if parent_permission == "Y"
                @people << Student.new(age, name)
            else
                @people << Student.new(age, name, parent_permission: false)
            end
            puts "Student added successfully"

        elsif person_type == 2
            print "Age: "
            age = gets.chomp.to_i
            print "Name: "
            name = gets.chomp
            print "Specialization: "
            specialization = gets.chomp
    
            @people << Teacher.new(age, specialization, name)
            puts "Teacher added successfully"
        else
            puts "Invalid option"
        end

    end

    # Create a method called create_book that will ask the user for the information required to create a new book and then create it.
    def create_book
        print "Title: "
        title = gets.chomp
        print "Author: "
        author = gets.chomp
    
        @books << Book.new(title, author)
        puts "Book created successfully"
    end

    def create_rental()
        puts "Select a book from the following list by number"
        @books.each_with_index do |book, index|
            puts "#{index} - Title: #{book.title} Author: #{book.author}"
        end
        book_index = gets.chomp.to_i
        selected_book = @books[book_index]
        puts "Select a person from the following list by number (not ID)"
        @people.each_with_index do |person, index|
            puts "#{index} - [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
        person_index = gets.chomp.to_i
        selected_person = @people[person_index]
        puts "Date: "
        date = gets.chomp
        @rentals << Rental.new(date, selected_book, selected_person)
        puts "Rental created successfully"
    end

    def list_rentals()
        puts "ID of person: "
        person_id = gets.chomp.to_i
        person_rentals = @rentals.select { |rental| rental.person.id == person_id }
        person_rentals.each do |rental|
            puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}}"

        end
    end


    def list_all_books()
        if @books.length > 0

            @books.each do |book, index|
                puts "Title: \"#{book.title}\", Author: #{book.author}"
            end
        else
            puts "There are no books in the library"
        end
    end

    def list_all_people()
        if @people.length > 0
            @people.each do |person|
                puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
            end
        else
            puts "There are no people in the library"
        end
    end

end

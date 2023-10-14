require_relative 'person'
require_relative 'book'
require_relative 'rental'

class Library
    def initialize()
        @people = []
        @books = []
        @running = true
    end

    # Create a method called create_person that will ask the user for the information required to create a new person and then create it.
    def create_person
        print  "Do you want to create a Student (1) or a teacher (2)? [Input the number]: "
        person_type = gets.chomp.to_i
        if person_type == 1
            print "Age: "
            age = gets.chomp.to_i
            print "Name: "
            name = gets.chomp
            print "Has parent permission? [Y/N]: "
            parent_permission = gets.chomp.upcase == 'Y' ? true : false
    
            @people << Student.new(age, name, parent_permission)
            puts "Student added successfully"
        elsif person_type == 2
            print "Age: "
            age = gets.chomp.to_i
            print "Name: "
            name = gets.chomp
            print "Specialization: "
            specialization = gets.chomp
    
            @people << Teacher.new(age, name, specialization)
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

    def list_all_books
        @books.each do |book, index|
            puts "Title: #{book.title} Author: #{book.author}"
        end
    end


end


puts "Welcome to School Library App!"

while 
    puts "\n"
    puts "Please choose an option by enterin a number"
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a fiven person id"
    puts "0 - Exit"

    option = gets.chomp.to_i

    case option
    when 1
        list_all_books()
    when 0
        run = false
    when 4
        create_book()
    else
        puts "\e[31mInvalid option. Please try again\e[0m"
    end
end


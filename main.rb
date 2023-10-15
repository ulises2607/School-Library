require_relative 'app'

def main
  my_library = Library.new()
  puts "Welcome to School Library App!"

  while my_library.running
    puts "\n"
    puts "Please choose an option by entering a number"
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a given person id"
    puts "0 - Exit"

    option = gets.chomp.to_i

    case option
    when 1
      my_library.list_all_books()
    when 2
      my_library.list_all_people()
    when 3
      my_library.create_person()
    when 4
      my_library.create_book()
    when 5
      my_library.create_rental()
    when 6
      my_library.list_rentals()
    when 0
      my_library.running = false
    else
      puts "\e[31mInvalid option. Please try again\e[0m"
    end
  end
end

main
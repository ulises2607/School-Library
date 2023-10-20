module UserInterface
  def self.print_main_menu
    puts "\n"
    puts '----------------------------------'
    puts 'Please choose an option by entering a number'
    puts '----------------------------------'
    puts "\n"
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    puts "\n"
  end

  def self.user_input
    gets.chomp
  end
end

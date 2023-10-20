require_relative 'user_interface'
require_relative 'book_manager'
require_relative 'people_manager'
require_relative 'rental_manager'

class App
  attr_accessor :running, :rentals, :book_manager, :people_list

  def initialize
    @book_manager = BookManager.new
    @people_manager = PeopleManager.new
    @rental_manager = RentalManager.new(@book_manager, @people_manager)
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
    @book_manager.save_books
    @people_manager.save_people
    @rental_manager.save_rentals
    @running = false
  end

  def handle_invalid_option
    puts "\e[31mInvalid option. Please try again\e[0m"
  end

  def create_person()
    @people_manager.create_person
  end

  def create_book
    @book_manager.create_book
  end

  def create_rental()
    @rental_manager.create_new_rental(@book_manager.books_list, @people_manager.people_list,
                                      @rental_manager.rentals_list)
  end

  def list_rentals()
    @rental_manager.show_rentals
    gets.chomp
  end

  def list_all_books()
    @book_manager.show_books
    gets.chomp
  end

  def list_all_people()
    @people_manager.show_people
    gets.chomp
  end
end

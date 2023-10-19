require_relative 'user_interface'
require_relative 'people_creation'
require_relative 'list'
require_relative 'book_creation'
require_relative 'rental_creation'
require_relative 'save_data'

class App
  attr_accessor :people_list, :books_list, :running, :rentals

  def initialize
    @books_list = []
    @people_list = []
    @rentals_list = []
    @list = List.new
    @create_people = PeopleCreation.new
    @create_rentals = RentalCreation.new
    @create_books = BookCreation.new
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
    DataSaver.save_books(@books_list)
    DataSaver.save_people(@people_list)
    DataSaver.save_rentals(@rentals_list)
    @running = false
  end

  def handle_invalid_option
    puts "\e[31mInvalid option. Please try again\e[0m"
  end

  def create_person()
    @create_people.create_person(@people_list)
  end

  def create_book
    @create_books.create_book(@books_list)
  end

  def create_rental()
    @create_rentals.create_rental(@books_list, @people_list, @rentals_list)
  end

  def list_rentals()
    @list.rentals(@people_list)
    gets.chomp
  end

  def list_all_books()
    @list.books(@books_list)
    gets.chomp
  end

  def list_all_people()
    @list.people(@people_list)
    gets.chomp
  end
end

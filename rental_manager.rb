

class RentalManager
    
    attr_accessor :rentals_list, :book_manager, :people_manager

    def initialize(book_manager, people_manager)
        @book_manager = book_manager
        @people_manager = people_manager
        @rentals_list = []
        self.load_rentals
    end

    def create_new_rental(books, people, rentals)
        puts 'Select a book from the following list by number'
        books.each_with_index do |book, index|
          puts "#{index} - Title: #{book.title} Author: #{book.author}"
        end
        book_index = gets.chomp.to_i
        selected_book = books[book_index]
    
        puts 'Select a person from the following list by number (not ID)'
        people.each_with_index do |person, index|
          puts "#{index} - [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
        person_index = gets.chomp.to_i
        selected_person = people[person_index]
    
        print 'Date: '
        date = gets.chomp
    
        rentals << Rental.new(date, selected_book, selected_person)
        puts 'Rental created successfully'
      end

    def save_rentals
        File.open('rentals.json', 'w') do |file|
            file.puts JSON.generate(@rentals_list.map(&:to_json))
        end
    end

    def load_rentals
        if File.exist?('rentals.json')
            if File.size('rentals.json') == 0
                @rentals_list = []
            else
                catched_data = JSON.parse(File.read('rentals.json'))
                @rentals_list = catched_data.map do |rental|
                    # Rental.new(rental['date'], rental['book'], rental['person'])
                    create_rental(rental) if rental['book'] && rental['person']
                end
            end
        else
            @rentals_list = []
        end
    end

    def find_book(rental)
        @book_manager.books_list.find { |book| book.title == rental['book']['title'] && book.author == rental['book']['author']}
    end

    def find_person(rental)
        @people_manager.people_list.find { |person| person.name == rental['person']['name'] && person.age == rental['person']['age'] }
    end

    def create_rental(rental)
        Rental.new(rental['date'], find_book(rental), find_person(rental))
    end

    def show_rentals
        @people_manager.people_list.each do |person|
          puts "- [#{person.class}] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
        end
    
        print 'ID of person: '
        person_id = gets.chomp.to_i
        person_obj = @people_manager.people_list.find { |p| p.id == person_id }
    
        if person_obj
          if person_obj.rentals
            puts 'Rentals:'
            person_obj.rentals.each do |rental|
              puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
            end
          else
            puts 'This person has no rentals.'
          end
        else
          puts 'Person not found.'
        end
    
        puts 'Press Enter to continue!'
      end
    end
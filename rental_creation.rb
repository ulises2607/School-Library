rental_creation.rb
require_relative 'rental'
class RentalCreation
    def create_rental(books, people, rentals)
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
end

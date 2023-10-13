require_relative 'book'
require_relative 'person'

class Rental
    attr_reader :date
    attr_reader :book, :person

    def initialize(date, book, person)
        @date = date
        @book = book
        @person = person

        book.add_rental(self)
        person.add_rental(self)
    end
end


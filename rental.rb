require_relative 'book'
require_relative 'person'

class Rental
  attr_reader :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    book.add_rental(self)
    person.add_rental(self)
  end

  def to_json(*_args)
    { 'date' => @date, 'book' => @book.to_json, 'person' => @person.to_json }
  end
end

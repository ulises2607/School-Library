require 'rspec'
require_relative '../rental'
require_relative '../book'
require_relative '../student'

describe Rental do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:student) { Student.new(30, 'John Wick') }
  let(:date) { '2023-10-20' }
  let(:rental) { Rental.new(date, book, student) }

  describe 'attributes' do
    it 'has a date' do
      expect(rental.date).to eq(date)
    end

    it 'has a book' do
      expect(rental.book).to eq(book)
    end

    it 'has a person' do
      expect(rental.person).to eq(student)
    end
  end

  describe 'initialization' do
    it 'creates a new rental with a date, book, and person' do
      expect(rental).to be_a(Rental)
    end

    it 'associates the rental with the book' do
      expect(book.rentals).to include(rental)
    end

    it 'associates the rental with the person' do
      expect(student.rentals).to include(rental)
    end
  end
end

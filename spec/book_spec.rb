require 'rspec'
require_relative '../book'

describe Book do
  let(:book) { Book.new('Sample Title', 'Sample Author') }

  describe '#add_rental' do
    it 'adds a rental to the rentals list' do
      rental = double('Rental')
      book.add_rental(rental)
      expect(book.instance_variable_get(:@rentals)).to include(rental)
    end
  end

  describe '#rentals_list' do
    it 'returns a list of rental dates' do
      rental1 = double('Rental', date: '2023-10-01')
      rental2 = double('Rental', date: '2023-10-15')

      book.instance_variable_set(:@rentals, [rental1, rental2])
      expect(book.rentals_list).to eq(%w[2023-10-01 2023-10-15])
    end
  end

  describe '#to_json' do
    it 'returns book details as a JSON hash' do
      json_data = { 'title' => 'Sample Title', 'author' => 'Sample Author' }
      expect(book.to_json).to eq(json_data)
    end
  end
end

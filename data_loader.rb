require 'json'

module DataLoader
  def self.load_books
    if File.exist?('books.json')
      JSON.parse(File.read('books.json'))
    else
      []
    end
  end

  def self.load_people
    if File.exist?('people.json')
      JSON.parse(File.read('people.json'))
    else
      []
    end
  end

  def self.load_rentals
    if File.exist?('rentals.json')
      JSON.parse(File.read('rentals.json'))
    else
      []
    end
  end
end

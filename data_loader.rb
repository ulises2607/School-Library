require 'json'

module DataLoader
  def self.load_books
    if File.exist?('books.json')
      if File.empty?('books.json')
        []
      else
        JSON.parse(File.read('books.json'))
      end
    else
      []
    end
  end

  def self.load_people
    if File.exist?('people.json')
      if File.empty?('people.json')
        []
      else
        JSON.parse(File.read('people.json'))
      end
    else
      []
    end
  end

  def self.load_rentals
    if File.exist?('rentals.json')
      if File.empty?('rentals.json')
        []
      else
        JSON.parse(File.read('rentals.json'))
      end
    else
      []
    end
  end
end

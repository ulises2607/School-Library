require 'json'
module DataSaver

  # SAVE BOOKS
  def self.save_books(books)
    if File.exist?('books.json')
      if !File.read('books.json').empty?
        books_data = JSON.parse(File.read('books.json'))
      else
        books_data = []
      end
    else
      books_data = []
    end
    books_data += books.map(&:to_json)
    File.open('books.json', 'w') do |file|
      file.puts JSON.generate(books_data)
    end
  end

  # SAVE PEOPLE
  def self.save_people(people)
    if File.exist?('people.json')
      if !File.read('people.json').empty?
        people_data = JSON.parse(File.read('people.json'))
      else
        people_data = []
      end
    else
      people_data = []
    end
    people_data += people.map(&:to_json)
    File.open('people.json', 'w') do |file|
      file.puts JSON.generate(people_data)
    end
  end


  # SAVE RENTALS
  def self.save_rentals(rentals)
    if File.exist?('rentals.json')
      if !File.read('rentals.json').empty?
        rentals_data = JSON.parse(File.read('rentals.json'))
      else
        rentals_data = []
      end
    else
      rentals_data = []
    end
    rentals_data += rentals.map(&:to_json)
    File.open('rentals.json', 'w') do |file|
      file.puts JSON.generate(rentals_data)
    end
  end

  def self.load_books()
    if File.exist?('books.json')
      JSON.parse(File.read('books.json'))
    else
      []
    end
  end
end

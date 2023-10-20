require 'json'
module DataSaver
  # SAVE BOOKS
  def self.save_books(books)
    books_data = if File.exist?('books.json')
                   if File.empty?('books.json')
                     []
                   else
                     JSON.parse(File.read('books.json'))
                   end
                 else
                   []
                 end
    books_data += books.map(&:to_json)
    File.open('books.json', 'w') do |file|
      file.puts JSON.generate(books_data)
    end
  end

  # SAVE PEOPLE
  def self.save_people(people)
    people_data = if File.exist?('people.json')
                    if File.empty?('people.json')
                      []
                    else
                      JSON.parse(File.read('people.json'))
                    end
                  else
                    []
                  end
    people_data += people.map(&:to_json)
    File.open('people.json', 'w') do |file|
      file.puts JSON.generate(people_data)
    end
  end

  # SAVE RENTALS
  def self.save_rentals(rentals)
    rentals_data = if File.exist?('rentals.json')
                     if File.empty?('rentals.json')
                       []
                     else
                       JSON.parse(File.read('rentals.json'))
                     end
                   else
                     []
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

  def self.load_people()
    if File.exist?('people.json')
      JSON.parse(File.read('people.json'))
    else
      []
    end
  end
end

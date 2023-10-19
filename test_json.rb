require_relative 'save_data'

data = DataSaver.load_books

# puts ""
# puts data.each { |book| puts book.class }

puts data.map { |book| book['title'] }

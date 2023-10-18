require_relative 'book'

class BookCreation
  def create_book(books)
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    books << Book.new(title, author)
    puts 'Book created successfully'
  end
end

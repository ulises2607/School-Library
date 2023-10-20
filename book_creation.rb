require_relative 'book'

class BookCreation
  def create_book(books)
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    books << new_book
    puts 'Book created successfully'
  end
end

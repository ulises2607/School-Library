require_relative 'book'

class BookManager
  attr_accessor :books_list

  def initialize
    @books_list = []
    load_books
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books_list << new_book
    puts 'Book created successfully'
  end

  def save_books
    File.open('books.json', 'w') do |file|
      file.puts JSON.generate(@books_list.map(&:to_json))
    end
  end

  def load_books
    if File.exist?('books.json')
      if File.empty?('books.json')
        @books_list = []
      else
        catched_data = JSON.parse(File.read('books.json'))
        @books_list = catched_data.map do |book|
          Book.new(book['title'], book['author'])
        end
      end
    else
      @books_list = []
    end
  end

  def show_books
    if @books_list.empty?
      puts 'No books'
    else
      puts ''
      puts '-----------------'
      puts 'List of books'
      puts '-----------------'
      @books_list.each do |book|
        puts "Title: \"#{book.title}\", Author: #{book.author}"
      end
      puts '-----------------'
    end
    puts ''
    puts 'Press Enter to continue!'
  end
end

class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end

  def rentals_list
    @rentals.map(&:book)
  end

  def to_json(*_args)
    { 'title' => @title, 'author' => @author}
  end
end

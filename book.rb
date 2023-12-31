class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end

  def rentals_list
    @rentals.map(&:date)
  end

  def to_json(*_args)
    { 'title' => @title, 'author' => @author }
  end
end

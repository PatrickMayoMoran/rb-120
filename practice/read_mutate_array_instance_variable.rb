class Library
  attr_reader :books
  def initialize
    @books = []
  end
end

lib = Library.new
p lib.books
lib.books << "Grapes of Wrath"
p lib.books

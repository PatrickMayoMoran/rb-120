class Fruit
  def initialize(name)
    @name = name
  end

  def compare(other)
    puts "I am #{type} and you are #{other.type}"
  end

  protected
  def type
    name
  end

  private
  attr_reader :name
end

class Apple < Fruit
  protected
  def type
    name
  end
end

class Orange < Fruit; end
class Pear < Fruit; end

apple = Apple.new("Macintosh")
orange = Orange.new("Navel")
pear = Pear.new("Bradford")

apple.compare(orange) # I am Macintosh and you are Navel
orange.compare(pear) # I am Navel and you are Bradford
pear.compare(apple)

module Walkable

  def walk
    puts "#{format_name} #{gait} forward"
  end

end

class Person

include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def format_name
    "#{@name}"
  end


  private

  def gait
    "strolls"
  end
end

class Noble < Person
  attr_reader :title, :name

  def initialize(name, title)
    super(name)
    @title = title
  end

  def format_name
    "#{@title} #{@name}"
  end

  private

  def gait
    "struts"
  end

end

class Cat

include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def format_name
    "#{@name}"
  end


  private

  def gait
    "saunters"
  end
end

class Cheetah

include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def format_name
    "#{@name}"
  end


  private

  def gait
    "runs"
  end
end
mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"

byron = Noble.new("Byron", "Lord")
byron.walk
# => "Lord Byron struts forward"

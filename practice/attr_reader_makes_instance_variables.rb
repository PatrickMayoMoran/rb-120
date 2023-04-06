class Cat
  attr_reader :whiskers
  attr_writer :whiskers
  attr_accessor :fur
end

class Kitty
  def initialize
    @whiskers = nil
    @fur = nil
  end
end

tiny = Cat.new
p tiny.inspect # No instance variables listed
p tiny.instance_variables # Empty!
p tiny.whiskers # Nil default return for uninitialized instance variables
p tiny.instance_variable_defined?(:@whiskers)
p '#########'
p tiny.whiskers = nil
p tiny.inspect # Now it's there!
p tiny.instance_variables # it's been initialized!
p tiny.instance_variable_defined?(:@whiskers)
p '#########'
p tiny.fur # calling a getter not only returns default nil; it also does NOT
# initialize that instance variable
p tiny.inspect
p tiny.instance_variables
p '#########'
kitty = Kitty.new
p kitty.inspect
p kitty.instance_variables # Whereas Kitty initializes instance variables via
# constructor method

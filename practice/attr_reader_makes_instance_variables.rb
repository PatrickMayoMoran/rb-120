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

p tiny.whiskers = nil
p tiny.inspect
p tiny.instance_variables

p tiny.fur # calling a getter not only returns default nil; it also does NOT
# initialize that instance variable
p tiny.inspect
p tiny.instance_variables

kitty = Kitty.new
p kitty.inspect
p kitty.instance_variables

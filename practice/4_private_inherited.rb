class Parent
  def talk(other)
    other.speak
  end

  protected

  def speak
    puts "I'm speaking"
  end
end

class Child < Parent
  protected

  def speak
    puts "I'm babbling"
  end
end

child = Child.new
parent = Parent.new

child.talk(child) # I'm babbling
parent.talk(parent) # I'm speaking
child.talk(parent) # I'm speaking
parent.talk(child) # Error - parents don't understand child's babbling!

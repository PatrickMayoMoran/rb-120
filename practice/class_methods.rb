class Cat
  def self.meow
    puts "I am #{type}"
  end
end

class Kitty < Cat
  def self.type
    self
  end
end

Kitty.meow

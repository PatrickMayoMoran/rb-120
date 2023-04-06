class Cat
  @@cats = 0
  def initialize
    @@cats += 1
  end

  def self.cats
    @@cats
  end

  def self.cats=(arg)
    @@cats = arg
  end
end

class Kitty < Cat; @@cats = 15; # This changes the variable in Cat!
end

tiny = Cat.new
p Cat.cats
p Kitty.cats
kitty = Kitty.new
p Cat.cats
p Kitty.cats

class Animal
  attr_accessor :name

  def initialize
  end

  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  attr_accessor :name, :color

  def initialize(color)
    super
     self.color = color
  end

  def speak
    super + " from GoodDog class!"
  end

end

class Cat < Animal
end

class Bear < Animal
  def initialize(color)
    super()
    @color = color
  end
end

p Bear.new("brown")

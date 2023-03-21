class Animal
  attr_accessor :name

  def initialize(name)
    self.name = name
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

class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

p BadDog.new(2, "Bear")

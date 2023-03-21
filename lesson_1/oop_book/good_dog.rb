class GoodDog
  attr_accessor :name

  def initialize(name)
    @name = name
  end


  def speak
    "#{name} says arf!"
  end

  def self.what_am_i
    "I'm a GoodDog class!"
  end

end

puts GoodDog.what_am_i

class GoodDog
  @@number_of_dogs = 0

  attr_accessor :name

  def initialize(name)
    @name = name
    @@number_of_dogs += 1
  end


  def speak
    "#{name} says arf!"
  end

  def self.what_am_i
    "I'm a GoodDog class!"
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end

end

puts GoodDog.total_number_of_dogs

dog1 = GoodDog.new("Sparky")
dog2 = GoodDog.new("Fido")

puts GoodDog.total_number_of_dogs

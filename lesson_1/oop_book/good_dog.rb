class GoodDog
  DOG_YEARS = 7
  @@number_of_dogs = 0

  attr_accessor :name
  attr_reader :age

  def initialize(n, a)
    @name = n
    @age = a * DOG_YEARS
    @@number_of_dogs += 1
  end


  def speak
    "#{name} says arf!"
  end

  def to_s
    "This dog's name is #{name} and its age is #{age}."
  end

  def self.what_am_i
    "I'm a GoodDog class!"
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end

end

sparky = GoodDog.new("Sparky", 4)
puts sparky
p sparky

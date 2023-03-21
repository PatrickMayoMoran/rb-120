class Vehicle
  attr_accessor :speed, :color
  attr_reader :year, :model

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def brake
    self.speed = 0
  end

  def speed_up
    self.speed = 60
  end

  def shut_off
    puts "Car off - don't forget the keys!"
  end
end

class MyCar < Vehicle

  def spray_paint(color)
    puts "Your car is currently #{self.color}"
    puts "changing color of the car..."
    self.color = color
    puts "Your car is now #{color}"
  end

  def self.mileage(gallons, miles)
    "This car gets #{miles/gallons} miles per gallon."
  end

  def to_s
    "My car is a #{self.color} #{self.year} #{self.model}."
  end

end

mocha = MyCar.new(2011, 'maroon', 'CRV')
puts mocha

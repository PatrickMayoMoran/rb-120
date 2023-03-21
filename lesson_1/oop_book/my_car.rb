module Towable
  def haul(object)
    "Now, you're hauling #{object}."
  end
end

class Vehicle
  attr_accessor :speed, :color
  attr_reader :year, :model

  @@number_of_vehicles = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@number_of_vehicles += 1
  end

  def self.number_of_vehicles
    @@number_of_vehicles
  end

  def brake
    self.speed = 0
  end

  def speed_up
    self.speed = 60
  end

  def spray_paint(color)
    puts "Your vehicle is currently #{self.color}"
    puts "changing color..."
    self.color = color
    puts "Your vehicle is now #{color}"
  end

  def mileage(gallons, miles)
    "#{miles/gallons} miles per gallon."
  end

  def shut_off
    puts "Car off - don't forget the keys!"
  end
end

class MyCar < Vehicle
  TYPE_OF_VEHICLE = 'Passenger'

  def to_s
    "My car is a #{self.color} #{self.year} #{self.model}."
  end

end

class Truck < Vehicle
  include Towable
  TYPE_OF_VEHICLE = 'Cargo'

  def to_s
    "My truck is a #{self.color} #{self.year} #{self.model}."
  end
end

mocha = MyCar.new('2011', 'maroon', 'CRV')
mocha.speed_up
puts mocha.speed
mocha.brake
puts mocha.speed
puts mocha.mileage(3,60)
puts mocha
puts mocha.spray_paint("Shiny Maroon")
puts mocha

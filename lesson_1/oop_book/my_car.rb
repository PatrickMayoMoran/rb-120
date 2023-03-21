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

  def shut_off
    puts "Car off - don't forget the keys!"
  end
end

class MyCar < Vehicle
  TYPE_OF_VEHICLE = 'Passenger'

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

class Truck < Vehicle
  include Towable
  TYPE_OF_VEHICLE = 'Cargo'
end

puts "---Truck ancestors---"
puts Truck.ancestors
puts "---Vehicle ancestors ---"
puts Vehicle.ancestors
puts '---MyCar ancestors----'
puts MyCar.ancestors

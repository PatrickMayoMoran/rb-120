class Vehicle
  attr_accessor :speed, :heading
  attr_writer :fuel_efficiency, :fuel_capacity

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

module Wheeled
  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < Vehicle
  include Wheeled

  def initialize
    super(50, 25.0)
    @tires = [30, 30, 32, 32]
  end
end

class Motorcycle < Vehicle
  include Wheeled

  def initialize
    super(80, 8.0)
    @tires = [20, 20]
  end
end

class Catamaran < Vehicle
  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    # ... code omitted ...
  end
end

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end

  def start_engine
    "Ready to go!"
  end

end

class Truck < Vehicle
  attr_reader :bed_type

  def initialize(year, bed_type)
    super(year)
    @bed_type = bed_type
  end

  def start_engine(speed)
    super() + " Drive #{speed}, please!"
  end

end

class Car < Vehicle
end

truck1 = Truck.new(1994, 'Short')
puts truck1.start_engine('fast')

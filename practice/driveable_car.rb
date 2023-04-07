class Driveable
  def self.drive
    puts "I'm driving"
  end
end

class Car
  include Driveable
end

bobs_car = Car.new
bobs_car.drive

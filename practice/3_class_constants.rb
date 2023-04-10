WHEELS = 99
BasicObject::WHEELS = 5

class Vehicle 
  # WHEELS = 4
  def self.wheels
    self::WHEELS
  end 
end

class Motorcycle < Vehicle 
  # WHEELS = 2
end
  
p Motorcycle.wheels

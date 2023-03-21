class MyCar
  attr_accessor :speed, :color
  attr_reader :year
  
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

  def spray_paint(color)
    puts "Your car is currently #{self.color}"
    puts "changing color of the car..."
    self.color = color
    puts "Your car is now #{color}"
  end

end

mocha = MyCar.new(2011, 'maroon', 'Honda')
puts mocha.speed
puts "Speeding up..."
mocha.speed_up
puts mocha.speed
puts "Slowing down..."
mocha.brake
puts mocha.speed
mocha.spray_paint('Lime Green')
puts mocha.color
puts "Time for rest"
mocha.shut_off

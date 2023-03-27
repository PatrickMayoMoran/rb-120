class KrispyKreme
  attr_reader :type, :topping
  def initialize(type, topping)
    @type = type
    @type = "Plain" if type.nil?
    @topping = topping
  end

  def to_s
    return "#{type} with #{topping}" unless topping.nil?
    "#{type}"
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
  #=> "Plain"

puts donut2
  #=> "Vanilla"

puts donut3
  #=> "Plain with sugar"

puts donut4
  #=> "Plain with chocolate sprinkles"

puts donut5
  #=> "Custard with icing"

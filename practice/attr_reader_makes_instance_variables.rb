class Cat
  attr_reader :whiskers
end

tiny = Cat.new
p tiny.whiskers # nil --> which makes me think yes, instance variable created
p tiny.tail # NoMethodError, doesn't exist; what I would have expected
# for line 6 if the zetcode distinction were true

class Cat
  def initialize(name)
    @name = name
  end

  def to_s
    1
  end
end

tiny = Cat.new("Tiny")
puts tiny
puts tiny.to_s

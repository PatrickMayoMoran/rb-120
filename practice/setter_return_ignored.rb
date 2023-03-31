class Dog
  def name=(name)
    @name = name
    puts "Name assigned!"
    return "Return this!"
  end
end

poppy = Dog.new
p poppy.inspect
p poppy.instance_variables

p poppy.name = "Poppy"
p poppy.inspect
p poppy.instance_variables

def meow
  puts "Meow!"
end

class Cat
end

Cat.new.purr # NoMethodError, undefined method 'purr', makes sense
Cat.new.meow # NoMethodError, private method 'meow'???

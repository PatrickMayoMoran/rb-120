module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end
end

kitty = Cat.new # Doesn't work! Looks for Cat in main scope and doesn't find it
kitty = Mammal::Cat.new
p kitty

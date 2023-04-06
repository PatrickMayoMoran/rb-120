class FarmAnimal
    def speak
      "#{self} says "
    end

    def to_s
       # self.class --> original line, returns class object, not string of class
      self.class.to_s # --> this creates desired behavior
    end
  end

  class Sheep < FarmAnimal
    def speak
      super + "baa!"
    end
  end

  class Lamb < Sheep
    def speak
      super + "baaaaaaa!"
    end
  end

  class Cow < FarmAnimal
    def speak
      super + "mooooooo!"
    end
  end

  p Sheep.new.speak# =>"#<Sheep:0x000000011f17df20> says baa!"
  p Lamb.new.speak# =>"#<Lamb:0x000000011f17dd40> says baa!baaaaaaa!"
  p Cow.new.speak# =>"#<Cow:0x000000011f17db60> says mooooooo!"

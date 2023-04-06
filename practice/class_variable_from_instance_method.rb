class Cat
  @@kitties = 0

  def self.kitties
    @@kitties
  end

  def litter
    @@kitties += 5
    puts "Kitties being born!"
  end
end

tiny = Cat.new
p Cat.kitties
tiny.litter
tiny.litter
p Cat.kitties

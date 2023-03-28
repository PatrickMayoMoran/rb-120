class Cat

  def be_cute
    self.meow
  end

  def talk(other)
    meow
    other.meow
  end

  def snuggle(other)
    zoomies
    other.zoomies
  end

  protected

  def zoomies
    meow
  end


  private

  def meow
    puts "meow"
  end
end

tiny = Cat.new
mags = Cat.new

# tiny.meow # private, doesn't work, NoMethodError
tiny.be_cute # works, called by same object within another method call

# mags.talk(tiny) # doesn't work, can't call private method on another object
# NoMethodError

tiny.snuggle(mags) # works! zoomies is called on the other object, which then
# uses self to call meow

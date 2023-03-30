# Questions:
#   How does inheritance/functionality of private/protected methods work?
#   What can or can't we call from objects that inherit from parents?

class Cat
  def hi
    meow
  end

  def play(other)
    talk; other.talk
  end

  def test(other)
    other.meow
  end

  protected
  def talk
    meow
  end

  private
  def meow; puts "meow"; end
end

class Kitty < Cat; end

class Panther < Kitty
protected
def talk; meow; end
private
def meow; puts "meow"; end
end

tiny = Kitty.new
mags = Cat.new
nittany = Panther.new

#tiny.meow --> Can't call private methods publicly
#mags.meow
tiny.hi
mags.hi

tiny.play(mags) #---> public play can call protected talk on other, which then
# calls meow on self
mags.play(tiny)

#tiny.test(mags) --> can't call private methods "publicly" from another object
tiny.play(nittany) # ---> can't call protected method on object 
# that has defined that for itself
#
# Protected method calls work for different objects in the inheritance 
# hierarchy IF they are sharing the protected method defined in the same
# lexical space.
# If subclasses define their own protected methods, these CANNOT be called by
# objects of other classes, even if they subclass

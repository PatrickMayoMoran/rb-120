class Person
  attr_accessor :first_name, :last_name

  def initialize(name)
    parse_full_name(name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(name)
    parse_full_name(name)
  end

  def same_name?(other)
    self.name == other.name
  end

  private

  def parse_full_name(name)
    parts = name.strip.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end

end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob.same_name?(rob)

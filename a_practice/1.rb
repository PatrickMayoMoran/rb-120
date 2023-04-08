# Given the following classes, implement the necessary methods to get the expected output.

class DataBase
  def initialize
    @things = []
  end

  def <<(other)
    things << other if !things.include?(other)
  end

  def show_things
    things.each { |t| puts "A #{t.class}: #{t}" }
  end

  private
  attr_reader :things
end

class Student
  def initialize(name, id)
    @name = name
    @id = id
  end

  def ==(other)
    id == other.get_id
  end

  def to_s
    name
  end

  protected
  def get_id
    id
  end

  private
  attr_reader :id, :name
end

jill1 = Student.new('Jill', 12345)
jill2 = Student.new('Jill', 67890)
jill3 = Student.new('Jill', 12345)

p jill1 == jill2              # false
p jill1 == jill3              # true

kids = DataBase.new

kids << jill1
kids << jill2
kids << jill3               # => That student is already in the database

kids.show_things
  # => A Student: Jill
  # => A Student: Jill

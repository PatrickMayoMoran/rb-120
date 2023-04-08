# Given the following classes, implement the necessary methods to get the expected output.

class DataBase
  def initialize
    @things = []
  end
end

class Student
  def initialize(name, id)
    @name = name
    @id = id
  end
end

jill1 = Student.new('Jill', 12345)
jill2 = Student.new('Jill', 67890)
jill3 = Student.new('Jill', 12345)

jill1 == jill2              # false
jill1 == jill3              # true

kids = DataBase.new

kids << jill1
kids << jill2
kids << jill3               # => That student is already in the database

kids.show_things
  # => A Student: Jill
  # => A Student: Jill

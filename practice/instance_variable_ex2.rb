class Student
  attr_accessor :grade
  def initialize(n, grade=nil)
    @name = n
  end
end

ade = Student.new("Adewale")
p ade

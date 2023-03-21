class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other)
    grade > other.grade
  end

  protected

  attr_reader :grade
end

joe = Student.new("Joe", 98)
bob = Student.new("Bob", 97)
puts "Joe's grade is better than Bob's:"
puts joe.better_grade_than?(bob)

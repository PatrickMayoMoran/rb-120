# SOLUTION 1 - Inheriting from Array; considered bad practice!
# class FixedArray < Array
# 
#   def []=(index, new_value)
#     raise IndexError if index >= self.size
#     super
#   end
# 
#   def [](index)
#     raise IndexError if index >= self.size
#     super
#   end
# end

# OPTION 2 - Use an array as a collaborator object
class FixedArray
  
  def initialize(size)
    @fixed = Array.new(size)
  end

  def [](index)
    fixed.fetch(index)
  end

  def []=(index, element)
    self[index]
    fixed[index] = element
  end

  def to_a
    fixed.clone
  end

  def to_s
    fixed.to_s
  end

  private
  attr_reader :fixed
end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end

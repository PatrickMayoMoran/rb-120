class Test
  attr_reader :input
  def initialize
    self.input = get_input
  end

  def input=(input)
    @input = input
  end

  def get_input
    puts "Enter some input: "
    gets.chomp
  end
end

test = Test.new
p test.input

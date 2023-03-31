class Game
  def initialize
    greet
    @type = choose_type
    @score = choose_score
    @rules = type.rules

    play
    # play_again?
    goodbye
  end

  def greet
    puts "Welcome to Rock Paper Scissors!"
  end

  def choose_type
    Type.explain
    @type = Type.choose
  end

  def play
    person = Person.new
    computer = Computer.new
    round until winner?
  end

  def round
  end

  def winner?
  end
end

class Type
  CHOICES = {1 => ::Classic, 2 => Type::RoShamBo, 3 => Type::RPSSL}
  def initialize(moves)
    @moves = moves
  end

  def self.explain
    puts "There are three variations to choose from:"
    CHOICES.each {|k,t| puts "#{k}: #{t}" }
    choice = nil
    loop do
      puts "Enter 1, 2, or 3 to read a description of that variation. Enter anything else to continue."
      choice = gets.chomp.to_i
      break unless CHOICES.key?(choice)
      CHOICES[choice].rules
    end

  end
end

class Classic < Type
  def initialize
    @moves = [:rock, :paper, :scissors]
  end
end

class RoShamBo < Type
end

class RPSSL < Type
end

class Move
end

class Rock < Move
  def initialize
    @beats = [Scissors, Lizard, Water]
    @ties = [Rock]
    @loses = [Paper, Spock, Fire]
  end
end

class Scissors < Move
end

class Paper < Move
end

class Spock < Move
end

class Lizard < Move
end

class Fire < Move
end

class Water < Move
end

class Player
end

class Person < Player
end

class Computer < Player
end

Game.new

def continue
  puts "========================="
  puts "Press enter to continue: "
  gets
  system 'clear'
end

class Engine
  def initialize
    greet
    continue
    loop do
      Game.new
      break unless play_again?
    end
    farewell
  end

  def greet
    system 'clear'
    puts "Welcome to Rock Paper Scissors!"
  end

  def farewell
    puts "Thanks for playing - Goodbye!"
  end

end

class Game
  def initialize
    @type = choose_type
    @score = choose_score
    @rules = type.rules

    play
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


class Classic
  def initialize
    @moves = [:rock, :paper, :scissors]
  end

  def self.rules
  <<~HEREDOC
  Classic Rock, Paper, Scissors works as follows:
    1) You and your opponent choose a move: Rock, Paper, or Scissors
    2) Moves are compared to see who wins!
  Here are the rules:
    Rock beats Scissors
    Scissors beats Paper
    Paper beats Rock
  HEREDOC
  end
end

class RoShamBo
  def self.rules
  <<~HEREDOC
  RoShamBo works as follows:
    1) You and your opponent choose a move: Rock, Paper, Scissors, Water, or Fire.
    2) Moves are compared to see who wins!
  Here are the rules:
    Rock beats Scissors
    Scissors beats Paper
    Paper beats Rock
    Fire beats everything but Water
    Water loses to everything but Fire
    You can choose Water as many times as you want
    You can only use Fire once
  HEREDOC
  end
end

class RPSSL
  def self.rules
    <<~HEREDOC
    Rock, Paper, Scissors, Spock, Lizard works as follows:
      1) You and your opponent choose a move: Rock, Paper, Scissors, Spock, or Lizard
      2) Moves are compared to see who wins!
    Here are the rules:
      Rock beats Scissors and Lizard
      Scissors beats Paper and Lizard
      Paper beats Rock and Spock
      Lizard beats Paper and Spock
      Spock beats Scissors and Rock
    HEREDOC
  end
end

class Type
  CHOICES = {1 => Classic, 2 => RoShamBo, 3 => RPSSL}


  def self.explain
    choice = nil
    loop do
      puts "There are three types of games: "
      CHOICES.each {|k,t| puts "#{k}: #{t.name}" }
      puts "Enter 1, 2, or 3 to read a description of that variation. Enter anything else to continue."
      choice = gets.chomp.to_i
      break unless CHOICES.key?(choice)

      type = CHOICES[choice]
      puts type.rules
      continue
    end
  end

  def self.choose
  end

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

Engine.new

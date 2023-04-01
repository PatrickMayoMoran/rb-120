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
  attr_reader :person, :type, :score, :computer, :moves
  def initialize
<<<<<<< HEAD
    @type = choose_type.new
    @moves = type.moves
    @person = Person.new(moves)
    @computer = Computer.new(moves)
=======
    @person = Person.new
    @computer = Computer.new
    #@type = choose_type
>>>>>>> development
    @score = choose_score
    @moves = [:rock, :paper, :scissors]

    play until winner?
    display_winner
    continue
  end

  def winner?
    person.score == score || computer.score == score
  end

  def choose_score
    puts "What score would you like to play to?"
    choice = nil
    loop do
      puts <<~HEREDOC
      1) Best of 1
      3) Best of 3
      5) Best of 5
      HEREDOC
      choice = gets.chomp.to_i
      break if [1,3,5].include?(choice)
      system 'clear'
      puts "Not a valid choice - please choose 1, 3, or 5."
    end

    puts "You chose #{choice}."
    continue
    choice
  end

  def choose_type
    Type.explain
    Type.choose
  end

  def play
    p = person.move(moves)
    c = computer.move(moves)
    person.score += 1 if p > c
    computer.score += 1 if c > p
  end

  #def winner?
  #end
end


class Classic
  attr_reader :moves
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
  attr_reader :moves

  def initialize
    @moves = [:rock, :paper, :scissors, :fire, :water]
  end

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
  attr_reader :moves

  def initialize
    @moves = [:rock, :paper, :scissors, :spock, :lizard]
  end

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

  attr_reader :moves

  def self.explain
    choice = nil
    loop do
      puts "There are three types of game to choose from: "
      self.display
      puts "Enter 1, 2, or 3 to read the rules for that type. Enter anything else to continue."
      choice = gets.chomp.to_i
      break unless valid?(choice)

      type = TYPES[choice]
      puts type.rules
      continue
    end
    system 'clear'
  end

  def self.valid?(choice)
    TYPES.key?(choice)
  end

  def self.display
    TYPES.each {|k,t| puts "#{k}: #{t.name}" }
  end

  def self.choose
    choice = nil
    loop do
      puts "Please enter 1, 2, or 3 to choose your game type:"
      self.display
      choice = gets.chomp.to_i
      break if valid?(choice)

      system 'clear'
      puts "Not a valid choice, please choose again."
      end

    type = TYPES[choice]
    puts "You chose #{type}."
    continue
    return type
  end

end


class Move
  include Comparable

  def <=>(other)
    1  if self.beats?(other)
    -1 if self.loses?(other)
    0  if self.ties?(other)
  end

  def beats?(other)
    true if beats.include?(other.class)
  end

  def loses?(other)
    true if loses.include?(other.class)
  end

  def ties?(other)
    self.class == other.class
  end

end

class Rock < Move
  def initialize
    @beats = [Scissors, Lizard, Water]
    @loses = [Paper, Spock, Fire]
  end
end

class Scissors < Move
  def initialize
    @beats = [Paper, Lizard, Water]
    @loses = [Rock, Spock, Fire]
  end
end

class Paper < Move
  def initialize
    @beats = [Rock, Spock, Water]
    @loses = [Scissors, Lizard, Fire]
  end
end

class Spock < Move
  def initialize
    @beats = [Rock, Scissors, Water]
    @loses = [Paper, Lizard, Fire]
  end
end

class Lizard < Move
  def initialize
    @beats = [Paper, Spock, Water]
    @loses = [Rock, Scissors, Fire]
  end
end

class Fire < Move
  def initialize
    @beats = [Paper, Spock, Rock, Scissors, Lizard]
    @loses = [Water]
  end
end

class Water < Move
  def initialize
    @beats = [Fire]
    @loses = [Paper, Spock, Rock, Scissors, Lizard]
  end
end

class Player
  attr_accessor :score

  def initialize(moves)
    @name = get_name
    @moves = moves
  end
end

class Person < Player
  attr_accessor :name

  def move(moves)
    puts "Please choose a move"
    moves.each { |move| move.display}
  end

  def get_name
    puts "What's your name?"
    name = nil
    loop do
      name = gets.chomp
      break if valid?(name)
      system 'clear'
      puts "Please enter a valid name."
    end

    self.name = name
    puts "Nice to meet you #{name}!"
    continue

  end

  def valid?(name)
    !name.empty?
  end
end

class Computer < Player

  def get_name
    @name = ['Mufasa', 'Scar', 'TinyCat'].sample
  end
end

Engine.new

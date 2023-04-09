module Prompt
  def self.continue
    puts "========================="
    puts "Press enter to continue: "
    gets
    clear
  end

  def self.clear
    system 'clear'
  end
end

class Engine
  def initialize
    greet
    Prompt.continue
    get_game_settings
    make_game(settings)
    #break unless play_again?
    farewell
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
      Prompt.clear
      puts "Not a valid choice - please choose 1, 3, or 5."
    end

    puts "You chose #{choice}."
    Prompt.continue
    choice
  end

  def greet
    Prompt.clear
    puts "Welcome to Rock Paper Scissors!"
  end

  def farewell
    puts "Thanks for playing - Goodbye!"
  end

  def get_game_settings
    raise NotImplementedError, "You haven't defined this yet"
  end

  def make_game
    raise NotImplementedError, "You haven't defined this yet"
  end

end

class Game
  attr_reader :person, :type, :score, :computer, :moves
  def initialize
    @person = Person.new(moves)
    @computer = Computer.new(moves)
    @moves = type.moves
    @score = choose_score

    play until winner?
    display_winner
    Prompt.continue
  end

  def winner?
    person.score == score || computer.score == score
  end


  def choose_type
    Type.explain
    Type.choose
  end

  def play
    p = person.move
    c = computer.move
    person.score += 1 if p > c
    computer.score += 1 if c > p
  end

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
      Prompt.continue
    end
    Prompt.clear
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

      Prompt.clear
      puts "Not a valid choice, please choose again."
      end

    type = TYPES[choice]
    puts "You chose #{type}."
    Prompt.continue
    return type
  end

end


class Move
  include Comparable

  def initialize
    @beats = beats
    @loses = loses
  end

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

  def beats; raise NotImplementedError; end

  def loses; raise NotImplementedError; end
end

class Rock < Move
  def beats; [Scissors, Lizard, Water]; end
  def loses; [Paper, Spock, Fire]; end
end

class Scissors < Move
  def beats; [Paper, Lizard, Water]; end
  def loses; [Rock, Spock, Fire]; end
end

class Paper < Move
  def beats; [Rock, Spock, Water]; end
  def loses; [Scissors, Lizard, Fire]; end
end

class Spock < Move
  def beats; [Rock, Scissors, Water]; end
  def loses; [Paper, Lizard, Fire]; end
end

class Lizard < Move
  def beats; [Paper, Spock, Water]; end
  def loses; [Rock, Scissors, Fire]; end
end

class Fire < Move
  def beats; [Paper, Spock, Rock, Scissors, Lizard]; end
  def loses; [Water]; end
end

class Water < Move
  def beats; [Fire]; end
  def loses; [Paper, Spock, Rock, Scissors, Lizard]; end
end

class Player
  attr_accessor :score

  def initialize(moves)
    @name = get_name
    @moves = moves
  end

  def display_moves
    moves.each {|k,m| puts "#{k}: #{move}" }
  end

  def moves
    choices = {}
    @moves.each_with_index {|m,i| choices[i+1] = m }
    choices
  end
end

class Person < Player
  attr_accessor :name

  def move
    puts "Please choose a move"
    display_moves
    choice = nil
    loop do
      choice = gets.chomp.to_i
      break choice if moves.key?(choice)
      Prompt.clear
      "Not valid - please enter the number of your choice."
    end
    puts "You chose #{moves[choice]}"
    Prompt.continue
  end

  def get_name
    puts "What's your name?"
    name = nil
    loop do
      name = gets.chomp
      break if valid?(name)
      Prompt.clear
      puts "Please enter a valid name."
    end

    self.name = name
    puts "Nice to meet you #{name}!"
    Prompt.continue

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

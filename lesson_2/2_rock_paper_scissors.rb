require 'pry'

module Prompt
  def self.continue
    horizontal_rule
    puts "Press enter to continue: "
    gets
    clear
  end

  def self.horizontal_rule
    puts "=" * 60
  end

  def self.clear
    system 'clear'
  end
end

class Move
  include Comparable

  def initialize
    @beats = beats
    @loses = loses
  end

  def <=>(other)
    1  if beats?(other)
    -1 if loses?(other)
    0  if ties?(other)
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

class Classic
  def self.moves
    [Rock, Paper, Scissors]
  end

  def self.rules
    <<~HEREDOC
    Classic Rock, Paper, Scissors works as follows:
      Rock beats Scissors
      Scissors beats Paper
      Paper beats Rock
    HEREDOC
  end
end

class RoShamBo
  def self.moves
    [Rock, Paper, Scissors, Fire, Water]
  end

  def self.rules
    <<~HEREDOC
    RoShamBo works as follows:
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
  def self.moves
    [Rock, Paper, Scissors, Spock, Lizard]
  end

  def self.rules
    <<~HEREDOC
    Rock, Paper, Scissors, Spock, Lizard works as follows:
      Rock beats Scissors and Lizard
      Scissors beats Paper and Lizard
      Paper beats Rock and Spock
      Lizard beats Paper and Spock
      Spock beats Scissors and Rock
    HEREDOC
  end
end

class TypeChooser
  attr_reader :type

  def initialize
    @types = { 1 => Classic, 2 => RoShamBo, 3 => RPSSL }
    explain
    @type = choose
  end

  private

  attr_reader :types

  def explain_heredoc
    puts <<~HEREDOC
    There are three types of game to choose from:
    HEREDOC
    display
    puts <<~HEREDOC
    Enter 1, 2, or 3 to read the rules for that type.
    Enter anything else to continue.
    HEREDOC
  end

  def explain
    choice = nil
    loop do
      explain_heredoc
      choice = gets.chomp.to_i
      Prompt.clear
      break unless valid?(choice)
      type = types[choice]
      puts type.rules
      Prompt.continue
    end
  end

  def valid?(choice)
    types.key?(choice)
  end

  def display
    types.each { |k, t| puts "#{k}: #{t.name}" }
  end

  def validate_choice
    choice = nil
    loop do
      puts "Please enter 1, 2, or 3 to choose your game type:"
      display
      choice = gets.chomp.to_i
      break if valid?(choice)
      Prompt.clear
      puts "Not a valid choice, please choose again."
    end
    choice
  end

  def choose
    choice = validate_choice
    type = types[choice]
    puts "You chose #{type}."
    Prompt.continue
    type
  end
end

class GameSettings
  attr_reader :score, :type, :moves

  def initialize
    @score = choose_score
    @type = choose_type
    @moves = type.moves
  end

  def config
    { score: score, type: type, moves: moves }
  end

  private

  def score_options
    [1, 3, 5]
  end

  def display_score_options
    score_options.each do |s|
      puts "#{s}) Best of #{s}"
    end
  end

  def validate_score
    choice = nil
    loop do
      choice = gets.chomp.to_i
      break if score_options.include?(choice)
      Prompt.clear
      puts "Not a valid choice - please choose:"
      display_score_options
    end
    choice
  end

  def choose_score
    puts "What score would you like to play to?"
    display_score_options
    choice = validate_score
    puts "You chose #{choice}."
    Prompt.continue
    choice
  end

  def choose_type
    TypeChooser.new.type
  end
end

class GameFactory
  def initialize(settings); end
end

class Engine
  def initialize
    greet
    Prompt.continue
    loop do
      self.settings = choose_settings
      # Extra loop for playing another game with same settings
      start_game(settings)
      break # unless play_again?
    end
    farewell
  end

  def greet
    Prompt.clear
    puts "Welcome to Rock Paper Scissors!"
  end

  def farewell
    puts "Thanks for playing - Goodbye!"
  end

  private

  attr_accessor :settings

  def choose_settings
    GameSettings.new.config
  end

  def start_game(settings)
    GameFactory.new(settings)
  end
end

class Game
  attr_reader :person, :score, :computer, :moves

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

  def play
    p = person.move
    c = computer.move
    person.score += 1 if p > c
    computer.score += 1 if c > p
  end
end

class Player
  attr_accessor :score

  def initialize(moves)
    @name = choose_name
    @moves = moves
  end

  def display_moves
    moves.each { |k, m| puts "#{k}: #{m}" }
  end

  def moves
    choices = {}
    @moves.each_with_index { |m, i| choices[i + 1] = m }
    choices
  end
end

class Person < Player
  attr_accessor :name

  def validate_move
    move = nil
    loop do
      move = gets.chomp.to_i
      break move if moves.key?(move)
      Prompt.clear
      "Not valid - please enter the number of your choice."
    end
    move
  end

  def move
    puts "Please choose a move"
    display_moves
    move = validate_move
    puts "You chose #{moves[move]}"
    Prompt.continue
  end

  def validate_name
    name = nil
    loop do
      name = gets.chomp
      break if valid?(name)
      Prompt.clear
      puts "Please enter a valid name."
    end
    name
  end

  def choose_name
    puts "What's your name?"
    name = validate_name
    self.name = name
    puts "Nice to meet you #{name}!"
    Prompt.continue
  end

  def valid?(name)
    !name.empty?
  end
end

class Computer < Player
  def choose_name
    @name = ['Mufasa', 'Scar', 'TinyCat'].sample
  end
end

Engine.new

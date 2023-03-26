class Move
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  attr_accessor :name

  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value"
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors."
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "not a valid choice"
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  attr_accessor :name

  def set_name
    self.name = ['Hal', 'R2D2', 'Mufasa'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing. Good bye!"
  end

  def display_winner
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"

    case human.move
    when 'paper'
      puts "#{human.name} won!" if computer.move == 'rock'
      puts "#{human.name} lost!" if computer.move == 'scissors'
      puts "It's a tie!" if computer.move == 'paper'
    when 'rock'
      puts "#{human.name} won!" if computer.move == 'scissors'
      puts "#{human.name} lost!" if computer.move == 'paper'
      puts "It's a tie!" if computer.move == 'rock'
    when 'scissors'
      puts "#{human.name} won!" if computer.move == 'paper'
      puts "#{human.name} lost!" if computer.move == 'rock'
      puts "It's a tie!" if computer.move == 'scissors'
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again?"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer)
      puts "Sorry, please enter y or n."
    end

    return true if answer == 'y'
    false
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play

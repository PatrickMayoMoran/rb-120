class Board
  attr_reader :squares

  def initialize
    @squares = initialize_squares
  end

  def empty_squares
    squares.keys.select {|k| squares[k].empty?}
  end

  def set_square_at(choice, marker)
    squares[choice] = marker
  end

  def display
    puts "     |     |"
    puts "  #{squares[1]}  |  #{squares[2]}  |  #{squares[3]}  "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{squares[4]}  |  #{squares[5]}  |  #{squares[6]}  "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{squares[7]}  |  #{squares[8]}  |  #{squares[9]}  "
    puts "     |     |"
  end

  def initialize_squares
    (1..9).each_with_object({}) {|n,h| h[n] = new_square}
  end

  def new_square
    Square.new
  end
end

class Square
  attr_reader :mark
  def initialize
    @mark = default
  end

  def default
    ' '
  end

  def empty?
    mark == default
  end

  def to_s
    mark
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new('X')
    @computer = Player.new('O')
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe. Goodbye!"
  end


  def play
    display_welcome_message
    board.display

    loop do
      human_turn
    #  break if someone_won? || board_full?

      computer_turn
      board.display
    #  break if someone_won? || board_full?
    end
    #display_result
    display_goodbye_message
  end

  def empty_squares
    board.empty_squares
  end

  def human_turn
    puts "Please choose a square #{empty_squares}"
    choice = nil
    loop do
      choice = gets.chomp.to_i
      break if (1..9).include?(choice)
      puts "Sorry, not a valid choice - please enter a square 1-9"
    end

    board.set_square_at(choice, human.marker)
  end

  def computer_turn
    board.set_square_at((1..9).to_a.sample, computer.marker)
  end
end

game = TTTGame.new
game.play

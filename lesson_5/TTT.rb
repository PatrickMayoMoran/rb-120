class Board
  attr_reader :squares

  def initialize
    @squares = initialize_squares
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

  def to_s
    mark
  end
end

class Player
  def initialize
  end

  def mark
  end
end

class TTTGame
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new
    @computer = Player.new
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
    loop do
      board.display
      human_moves
      board.display
      break if someone_won? || board_full?

      computer_moves
      break if someone_won? || board_full?
    end
    display_result
    display_goodbye_message
  end
end

game = TTTGame.new
game.play

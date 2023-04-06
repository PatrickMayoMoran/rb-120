class Board
  WINNING_LINES = [[1,2,3], [4,5,6], [7,8,9]] +
                  [[1,4,7], [2,5,8], [3,6,9]] +
                  [[1,5,9], [3,5,8]]

  attr_reader :squares

  def initialize
    @squares = initialize_squares
  end

  def someone_won?
    !!detect_winner
  end

  def detect_winner
    WINNING_LINES.any? do |line|
      puts squares[*line]
    end
  end

  def empty_squares
    squares.keys.select {|k| squares[k].empty?}
  end

  def set_square_at(choice, marker)
    squares[choice] = marker
  end

  def full?
    squares.none? {|k,s| s.empty?}
  end

  def display
    system 'clear'
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
  HUMAN = 'X'
  COMPUTER = 'O'
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN)
    @computer = Player.new(COMPUTER)
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
      break if board.full? || board.someone_won?

      computer_turn
      board.display
      break if board.full?
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
      break if empty_squares.include?(choice)
      puts "Sorry, not a valid choice - please enter a square #{empty_squares}"
    end

    board.set_square_at(choice, human.marker)
  end

  def computer_turn
    board.set_square_at(empty_squares.sample, computer.marker)
  end
end

game = TTTGame.new
game.play

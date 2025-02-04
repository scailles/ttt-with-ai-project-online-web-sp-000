class Game
  
  attr_accessor :board, :player_1, :player_2, :input
  
  WIN_COMBINATIONS =   [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
  
  ]
  
  
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    
    @player_1=player_1
    @player_2=player_2
    @board=board
  end
  
  
  def current_player
    board.turn_count.even?  ? player_1 : player_2
  end
  
  
  def won?
    WIN_COMBINATIONS.find do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
    end
  end
  
  
  def draw?
    !won? && board.full?
  end
  
  
  def over?
    draw? || won?
  end
  
  
  def winner
    board.cells[won?[0]] if won?
  end
  
  
  def turn
    puts "Please enter a number 1-9:"
   input = current_player.move(board)
   if board.valid_move?(input)
     board.update
     board.turn_count
   end
   
 end
 

  
end
class Board
  
  attr_accessor :cells
  
  
  def initialize
    reset!
  end
  
  
  def reset!
    @cells =  @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  
  def display
  
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  
  
  def position(input)
    cells[input.to_i-1]
  end
  
  
  def full?
    cells.all?{|cell| cell=="X" || cell=="O"}
  end
  
  
  def turn_count
    cells.count{|cell| cell=="X" || cells=="O"}+1
  end
  
  
  def taken?(input)
    if position(input)=="X"||position(input)=="O"
      true
    else
      false
    end
  end
  
  
  def valid_move?(input)
    input = input.to_i
    !(taken?(input)) && input.between?(1, 9)
  end
  
  
  def update(input, player)
    input = input.to_i
    cells[input-1] = player.token
  end
    
  
  
    
    
  
    
    
    
  
  
end
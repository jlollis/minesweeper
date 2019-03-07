# minesweeper.rb - by Julie Lollis 

# How to Play:
# Open your terminal and type:
# ruby minesweeper.rb
# Then, follow the prompts. Have fun! ;)

require 'colorize'

class Board 
  attr_accessor :grid
  
  def initialize
    @rows = 9
    @value = nil
    @grid = grid

  end

  def generate_board(rows, value)
    board = Array.new(rows)

    rows.times do |row_idx|
      board[row_idx] = Array.new(rows)

      rows.times do |col_idx|
        board[row_idx][col_idx] = value
      end
    end

    board
  end  

  # randomly seed grid with bombs
  def random_seed
    @grid = []
    File.open('minefield.txt', 'w') do |file|

      @rows.times do |line|
        strip = (1..@rows).map { ['0', '0', '0', '0', '1'].sample }.join # 1 is Bomb, 0 is empty
        @grid << strip.split('').map(&:to_i)
        file.puts strip
      end
      file.close
      @grid
    end
  end

  def populate_board
    File.open('minefield.txt', 'r') do |file|

      file.each_line do |line|
        @grid << line.chomp.split('').map.(&:to_s)
      end
      p @grid
    end
  end

  def reveal_square
    # choose a square to reveal. 
    # If it contains a bomb, game over. 
    # Otherwise, it will be revealed. 
    # If none of its neighbors contains a bomb, 
    # then all the adjacent neighbors are also revealed. 
    # If any of the neighbors have no adjacent bombs, 
    # they too are revealed.
  end


  # update the value of a Tile to the given postition
  def choose_square
    # update selection for grid[col][row]
    # puts "#{@grid[2][0]}"
    
    puts "Select a square: "
    print "row: "
    row = gets.chomp.to_i
    print "column: "
    col = gets.chomp.to_i
    puts

    char = "_"
    
    puts @grid[row][col]

  end

  # def check_square
  #   x = grid[row][col]
  #     self.update_square
  #   end
  # end

  # def update_square

  # end

  # render current board state
  def render
    # puts "\e[H\e[2J"

    values = @grid
   
    puts "   +---+---+---+---+---+---+---+---+---+".light_black

    values.each_with_index do |row, idx|
      print "     #{idx} |".light_black
      row.each_with_index do |value, idx|
        if idx >= 1
          print "|".light_black
        end
        # color coding output to cells
        if " #{value} ".match?(/[B]/)  # bombs
          print " B ".red
        elsif value.is_a? String   # selected square
          print " #{value} ".light_yellow
        else
          print " ? ".light_black  
        end
      end
      print "|\n".light_black
      puts "       +---+---+---+---+---+---+---+---+---+".light_black
      
    end
    puts "         0   1   2   3   4   5   6   7   8".light_black
    puts  # adds newline at end of board
  end
  

  def solved?
    # are there any tiles on the board that are uncovered?
    if grid.flatten.each.include?(0)
      return false
    else
      puts "You found all the mines! Yay!!".light_yellow
      puts
      puts "  (•_•) / ( •_•)>⌐■-■ / (⌐■_■) ".light_yellow
      puts
      return true
    end
  end

  def splash
    title = %q{



    }.light_black

#  normal = %q{
#            _____                   _____
#           |     |                 |   __|
#           | | | |    ( ͡° ͜ʖ ͡°)     |__   |
#           |_|_|_|                 |_____|  
          
#  }.yellow

#  anticipation = %q{
#            _____                   _____
#           |     |                 |   __|
#           | | | |    ( ͡° ʖ ͡°)     |__   |
#           |_|_|_|        0        |_____| 
          
#  }.yellow

#  death = %q{
#            _____                   _____
#           |     |                 |   __|
#           | | | |    ( ͡X ʖ ͡X)     |__   |
#           |_|_|_|        ~        |_____| 
          
#  }.yellow
   print title

  end

end

class Game < Board
  # Game should have an instance variable for the Board
  @grid = []

  # methods for managing the Board-Player interaction
  def play

    # loop that runs until board is clear
    b = Board.new

    b.random_seed

    inside loop:
      until b.solved?
        # clear screen
        system "clear"
        # ascii title splash
        b.splash 
        # render board
        b.render
        # get x,y position from the player
        b.choose_square

        # check square
        
        # update square

      end
    end

  end




game = Game.new

game.play
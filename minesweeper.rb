# minesweeper.rb - by Julie Lollis 

# How to Play:
# Open your terminal and type:
# ruby minesweeper.rb
# Then, follow the prompts. Have fun! ;)

require 'colorize'

class Board 
  attr_accessor :grid, :tag, :dead, :row, :col
  
  def initialize
    @rows = 9
    @value = nil
    @grid = grid
    @tag = tag
    @flags = 10
    @dead = false
    @row =  nil
    @col = nil
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

  # def random_starting_square
  #   # could have the board choose the first non-losing square for you, like in the MS version
  #   # this is to add later, its only 9x9
  # end

  def populate_board
    File.open('minefield.txt', 'r') do |file|

      file.each_line do |line|
        @grid << line.chomp.split('').map.(&:to_i)
      end
      # p @grid
    end
  end

  # update the value of a Tile to the given postition
  def choose_square
    # update selection for grid[col][row]
    # puts "#{@grid[2][0]}"
    
    puts "Select a square: "
    print "row: "
    @row = gets.chomp.to_i
    print "column: "
    @col = gets.chomp.to_i

    if @flags == 0
      puts "Please enter (x) to open the square.  "
    else
      puts "Enter would you like to open the space, or flag it? "
      print "Enter (x) for open, or (f) for flag: "
    end

    tag = gets.chomp

    # tag is f or x
    @tag = tag.downcase

    if @grid[row][col] == 0
      puts "no bomb"
      if @tag.match?(/[f]/)   # flag square
        puts "flagged"
        @flags -= 1
        puts @flags
        @grid[row][col] = tag # update spot to "f"
      
      else                    # open square
        # clear adjacent squares if open 
        @grid[row][col] = tag # update spot to "x"
        
      end
    else 
      puts "bomb present"
      if @tag.match?(/[f]/)   # flag square
        puts "flagged"
        @flags -= 1
        puts @flags
        @grid[row][col] = tag  # update spot tp "f"

      else                    # open square
        # puts "you died"       # don't update, we will print where all the bombs were.
        @dead = true
      end
    end
  end
  
  # TODO:
  def inspect_adjacent_squares
    # If none of its neighbors contains a bomb, then all the adjacent neighbors are also revealed. If any of the neighbors have no adjacent bombs, they too are revealed. Et cetera.

    # The "fringe" of the revealed area is squares all adjacent to a bomb (or corner). The fringe should be revealed and contain the count of adjacent bombs.
  end

  def inspect
    # clear adjacent squares if empty
    # if @grid[row-1][col-1] == 0
    #   @grid[row-1][col-1] = "_"
    # end
    # if @grid[row-1][col] == 0
    #   @grid[row-1][col] = "_"
    # end
    # if @grid[row-1][col+1] == 0
    #   @grid[row-1][col+1] = "_"
    # end
    # if @grid[row][col-1] == 0
    #   @grid[row][col-1] = "_"
    # end
    # if @grid[row][col+1] == 0
    #   @grid[row][col+1] = "_"
    # end
    # if @grid[row+1][col-1] == 0
    #   @grid[row+1][col-1] = "_"
    # end
    # if @grid[row+1][col] == 0
    #   @grid[row+1][col] = "_"
    # end
    # if @grid[row+1][col+1] == 0
    #   @grid[row+1][col+1] = "_"
    # end
  end
   
  

  # render current board state
  def render
    # puts "\e[H\e[2J"

    values = @grid
   
    puts "       0   1   2   3   4   5   6   7   8".light_black
    puts "       +---+---+---+---+---+---+---+---+---+".light_black

    values.each_with_index do |r, i|
      print "     #{i} |".light_black
      r.each_with_index do |value, i|
        if i >= 1
          print "|".light_black
        end
        # color coding output to cells
        if " #{value} ".match?(/[f]/)  
          print " #{value} ".light_green
        elsif " #{value} ".match?(/[x_]/)  
          print " #{value} ".light_blue
        elsif value.is_a? String   # selected square
          print " #{value} ".light_yellow
        else
          print " ? ".light_black  
        end
      end
      print "|\n".light_black
      puts "       +---+---+---+---+---+---+---+---+---+".light_black
      
    end
    
    puts  # adds newline at end of board
    # p @grid
  end

  def render_later
    # puts "\e[H\e[2J"

    values = @grid
   
    puts "       0   1   2   3   4   5   6   7   8".light_black
    puts "       +---+---+---+---+---+---+---+---+---+".light_black

    values.each_with_index do |row, idx|
      print "     #{idx} |".light_black
      row.each_with_index do |value, idx|
        if idx >= 1
          print "|".light_black
        end
        # color coding output to cells
        if " #{value} ".match?(/[1]/)  # bombs
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
    
    puts  # adds newline at end of board
    @grid
  end

  

  def solved?
    # did you die?
    if @dead
      you_died
      render_later
    # are there any open spaces on the board that have not been uncovered or flagged?
    elsif grid.flatten.each.include?(0) 
      return false
    # then you win!
    else
      you_won
      render_later
      return true
    end
  end

  def splash
happy = "
           _____                   _____
          |     |                 |   __|
          | | | |    ( ͡° ͜ʖ ͡°)     |__   |
          |_|_|_|                 |_____|  
          
 ".yellow

anxious = %q{
           _____                   _____
          |     |                 |   __|
          | | | |    ( ͡° ʖ ͡°)     |__   |
          |_|_|_|        0        |_____| 
          
 }.yellow
   print happy
  end

  def you_died
dead = %q{
           _____                   _____
          |     |    YOU DIED!    |   __|
          | | | |    ( ͡X ʖ ͡X)     |__   |
          |_|_|_|        ~        |_____| 
          
 }.light_black
   print dead
  end

  def you_won
  winning = %q{
           _____                   _____
          |     | YOU GOT EM ALL! |   __|
          | | | |    (⌐-■ ͜ʖ-■)    |__   |
          |_|_|_|    <winning>    |_____|  
          
  }.light_green
   print winning
  end

end

class Game < Board
  # Game should have an instance variable for the Board
  @grid = []

  # methods for managing the Board-Player interaction
  def play

    # clear screen
    system "clear"

    # loop that runs until board is clear
    b = Board.new

    b.random_seed

    # inside loop:
      until b.solved?
        # clear screen
        system "clear"
        # ascii title splash
        b.splash 
        # render board
        b.render
        # p b 
        # p grid

        # get position from the player
        b.choose_square
        # b.inspect

        #p b 
        #p grid
        # check square
        
        # update square

      end
      # reveals the bombs after you die
      # b.render_later
    end

  end




game = Game.new

game.play
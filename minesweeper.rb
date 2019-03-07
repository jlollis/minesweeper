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

  def random_seed
    File.open('seed.txt', 'w') do |file|

      @rows.times do |x|
        file.puts (1..@rows).map { [0, 1].sample }.join
      end

      file.close
    end
  end

  def populate_board
    File.open('seed.txt') do |file|

      file.each_line do |line|
        @grid << line.chomp.split('').map
      end
      @grid
    end
  end

  # update the value of a Tile to the given postition
  def update_tile
    # update selection for grid[col][row]
    #puts "#{@grid[2][0]}"
    
    puts "Select a tile: "
    print "row: "
    row = gets.chomp.to_i
    print "column: "
    col = gets.chomp.to_i
    puts

    @grid[row][col] = val

  end

  # render current board state
  def render
    # puts "\e[H\e[2J"

    values = @grid
    puts "       +---+---+---+---+---+---+---+---+---+".light_black
    values.each do |row|
      print "       |".light_black
      row.each_with_index do |value, idx|
        if idx >= 1
          print "|".light_black
        end
        # color coding output to cells
        if " #{value} ".match?(/[0]/)  # no values printed for open spaces
          print "   "
        elsif value.is_a? String   # values changed by player are printed in yellow
          print " #{value} ".light_yellow
        else
          print " #{value} ".light_blue  # OG values are printed in blue
        end
      end
      print "|\n".light_black
      puts "       +---+---+---+---+---+---+---+---+---+".light_black
    end
    puts  # adds newline at end of board
  end
  

  def solved?
    are there any tiles on the board that are uncovered?
    if grid.flatten.each.include?(0)
      return false
    else
      puts " You completed the puzzle! Yay!!".light_yellow
      puts
      puts "        (•_•) / ( •_•)>⌐■-■ / (⌐■_■)       ".light_yellow

      puts
      return true
    end
  end

  def splash
    title = %q{
              ___  __        ___  ___  __   ___  __  
 |\/| | |\ | |__  /__` |  | |__  |__  |__) |__  |__) 
 |  | | | \| |___ .__/ |/\| |___ |___ |    |___ |  \ 
                                                     
          
}.light_blue

    print title

  end

end

class Game < Board
  # Game should have an instance variable for the Board
  @grid = []

  # methods for managing the Board-Player interaction
  def play

    # loop that runs until puzzle is solved
    b = Board.new

    b.random_seed
        b.generate_board

    b.populate_board

    # inside loop:
      until b.solved?
        # clear screen
        system "clear"
        # ascii title splash
        b.splash 
        # render board
        b.render
        # get x,y position from the player, check tile
        b.update_tile
      end
    end

  end




game = Game.new

game.play
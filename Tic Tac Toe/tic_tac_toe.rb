
# not the most DRY of implementations but works

class Board 
  attr_accessor :board, :player1, :player2

  def initialize(player1, player2)
  	@board = Hash.new
    @player1 = player1
    @player2 = player2
    create_positions
    start
    move
  end

  def create_positions
    a = 1
    b = 1 
    c = 1 
    3.times do 
      @board["a" + "#{a}"] = "-"
      a += 1 
    end
    3.times do
      @board["b" + "#{b}"] = "-"
      b += 1 
    end
    3.times do
      @board["c" + "#{c}"] = "-"
      c += 1 
    end
  end

  def print_board
    puts "   1   2  3 "
    puts "A | #{@board["a1"]} | #{@board["a2"]} | #{@board["a3"]} |"
    puts "B | #{@board["b1"]} | #{@board["b2"]} | #{@board["b3"]} |"
    puts "C | #{@board["c1"]} | #{@board["c2"]} | #{@board["c3"]} |"
  end

  def check_rules
    if @board["a1"] + @board["a2"] + @board["a3"] == ("XXX" || "OOO")
      puts @board["a1"] + " wins"
    elsif @board["b1"] + @board["b2"] + @board["b3"] == ("XXX" || "OOO")
      puts @board["b1"] + " wins"
    elsif @board["c1"] + @board["c2"] + @board["c3"] == ("XXX" || "OOO")
      puts @board["c1"] + " wins"
    elsif @board["a1"] + @board["b1"] + @board["c1"] == ("XXX" || "OOO")
      puts @board["c1"] + " wins"
    elsif @board["a2"] + @board["b2"] + @board["c2"] == ("XXX" || "OOO")
      puts @board["c1"] + " wins"
    elsif @board["a3"] + @board["b3"] + @board["c3"] == ("XXX" || "OOO")
      puts @board["c1"] + " wins"
    elsif @board["a1"] + @board["b2"] + @board["c3"] == ("XXX" || "OOO")
      puts @board["c1"] + " wins"
    elsif @board["a3"] + @board["b2"] + @board["c1"] == ("XXX" || "OOO")
      puts @board["c1"] + " wins"
    else
      return false
    end
  end

  def start
    puts "Hi #{@player1} you are X and go first."
    puts "\nHi #{@player2} you are O and go second."
    puts "\nHere's the board:"
    print_board
    puts "Please select a tile each go (e.g. a1, b3, c1)"
  end

  def move
    while check_rules == false
      puts "Hi #{@player1} where would you like to go?"
      position = gets.chomp
      @board[position] = "X"
      print_board

      puts "Hi #{@player2} where would you like to go?"
      position = gets.chomp
      @board[position] = "O"
      print_board
    end
  end
end

new_game = Board.new("Jake", "Joe")
new_game.create_positions
new_game.check_rules



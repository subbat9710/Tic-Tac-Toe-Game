require_relative "board.rb"
require_relative "console.rb"
require_relative "human.rb"
require_relative "random.rb"

#For randomplayer Vs player2
board = Board.new
player1 = RandomPlayer.new("x")
player2 = RandomPlayer.new("o")
currentplayer = player2

console = Console.new(board, player1, player2) 
puts "Wellcome Player1, What is your name? "
name = gets.chomp
console.display_board(board.board) #this line display the board in the terminals.
while !console.game_over? 
    print "#{name}, Enter your move: "
 	move = gets.chomp.to_i  
	board.set_position(move, "x")
	console.display_board(board.board)
    sleep 1
    if console.game_over?
        break
    end
    board.set_position(move, "o")
    console.display_board(board.board)
    end
    if board.winner_of_game == "X"
        puts  "#{name} you won, Congratulations!"
        exit
    elsif board.winner_of_game == "O"
        puts "RandomPlayer won, Congratulations!" 
        exit
    else
        puts "Game is in Tie, Try Again"    
    end
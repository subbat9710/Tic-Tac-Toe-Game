require_relative "board.rb"
require_relative "console.rb"
require_relative "sequential.rb"
require_relative "human.rb"

board = Board.new
player1 = Player.new("name", "x")
player2 = Sequential.new("o")
currentplayer = player2
get_move = player2.get_move(board.board)
 
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
    move = player2.get_move(board.board)
    board.set_position(move, "o")
    console.display_board(board.board)
	end
    if board.winner_of_game == "X"
        puts  "#{name} you won, Congratulations!"
        exit
    elsif board.winner_of_game == "O"
        puts "Sequential won, Congratulations!" 
        exit
    else
        puts "Game is in Tie, Try Again"    
    end
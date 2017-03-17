require_relative "board.rb"
require_relative "console.rb"
require_relative "human.rb"

class RandomPlayer
    attr_accessor :marker, :currentplayer

	def initialize(marker)
		@marker = marker
		@currentplayer = currentplayer
	end
    def move(board, currentplayer)
    	position = rand(0..8)
        if board.board[position] != "" 
            puts "#{board.board}"
            move(board, currentplayer)
    	else
    		position
            if rand(2) == 1
    	end
    	    position
        end
    end
end 
board = Board.new
player2 = RandomPlayer.new("o")
currentplayer = player2
move = player2.move(board, currentplayer)

console = Console.new(board) 
puts "Wellcome Player1, What is your name? "
name = gets.chomp
console.display_board(board.board) #this line display the board in the terminals.
while !console.game_over? 
    print "#{name} Enter your move: "
 	move = gets.chomp.to_i  
	board.set_position(move, "x")
	console.display_board(board.board)
    sleep 1
    if console.game_over?
        break
    end
    move = player2.move(board, currentplayer)
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
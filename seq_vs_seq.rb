require_relative "board.rb"
require_relative "sequential.rb"
require_relative "console.rb"

board = Board.new
console = Console.new(board)

player1 = Sequential.new("x")
player2 = Sequential.new("o")

# you can save code by creating a function that fills an array with alternating players 
# you can call the function maketurns(player1, player2)
# turns = [player1, player2, player1, player2,player1, player2,player1, player2,player1]


turn = 1

while true
	print console.display_board(board.board)
	puts ""
	move = nil
	if turn % 2 == 1
		move = player1.get_move(board.board)
		while !board.check_position?(move) # while the position is already taken by another mark, get another move (this will be important later)
			move = player1.get_move(board.board)
		end
		sleep 1
		board.set_position(move, player1.marker)
	else
		move = player2.get_move(board.board)
		while !board.check_position?(move) # while the position is already taken by another mark, get another move (this will be important later)
			move = player2.get_move(board.board)
		end
		sleep 1
		board.set_position(move, player2.marker)
	end

	if board.stub_winner?
		puts board.winner_of_game + ", Congratulations you won the game"
		break # end game
	end
	if board.tie
		puts "Game ends in tie."
		break
	end
	turn += 1
end
sleep 1
print console.display_board(board.board)
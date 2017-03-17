require_relative "board.rb"
require_relative "console.rb"
require_relative "random.rb"

board = Board.new
console = Console.new(board) 

player1 = RandomPlayer.new("x")
player2 = RandomPlayer.new("o")
currentplayer = player1


turn = 1

while true
	print console.display_board(board.board)
	puts ""
	move = nil
	if turn % 2 == 1
		move = player1.move(board, currentplayer)
		while !board.check_position?(move) # while the position is already taken by another mark, get another move (this will be important later)
			move = player1.move(board, currentplayer)
		end
		sleep 1
		board.set_position(move, player1.marker)
	else
		move = player2.move(board, currentplayer)
		while !board.check_position?(move) # while the position is already taken by another mark, get another move (this will be important later)
			move = player2.move(board, currentplayer)
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
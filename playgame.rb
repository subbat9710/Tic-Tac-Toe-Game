require_relative "console.rb"

board = Board.new
player1 = Player.new("name", "x")
player2 = Unbeatable.new("o")
console = Console.new(board, player1, player2)
#currentplayer = player1

while !console.game_over?
    console.switch_player(console.currentplayer) 
    move = console.get_move(board.board)

    board.set_position(move, console.currentplayer.marker)
	console.display_board(board.board)
    sleep 1
end
console.game_status
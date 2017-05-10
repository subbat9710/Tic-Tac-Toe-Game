require_relative "console.rb"

board = Board.new
player1 = Player.new("Teela", "x")
player2 = Unbeatable.new("o")
console = Console.new(board, player1, player2)

while !console.game_over? #while game is not over it continue palying
    console.switch_player(console.currentplayer) 
    move = console.get_move(board.board)

    board.set_position(move, console.currentplayer.marker)
	console.display_board(board.board)
    sleep 1
end
console.game_status #indicates the results of game whether winner, loser or tie

#I play TTTboard game by this file using console.rb. With this file I play all the sections of TTTboard 
#like Human Vs Human, Human Vs Sequense, Human Vs Random, Human Vs Unbeatable by making changes in 
#player2(line5 above)
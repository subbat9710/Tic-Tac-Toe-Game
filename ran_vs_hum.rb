require_relative "board.rb"
require_relative "console.rb"
require_relative "board_player.rb"

board = Board.new
console = Console.new(board)
player1 = Human.new("x")
player2 = Random.new("o")
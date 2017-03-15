require_relative "board.rb"
require_relative "console.rb"

class RandomPlayer
    attr_accessor :marker, :current_player

	def initialize(marker)
		@marker = marker
		@current_player = current_player
	end
    def move(board, current_player)
    	random = Random.new
    	random.rand(@board)
    end
end 
# random = Random.new
# board = Board.new
# console = Console.new
# console.get_move(current_player)
# p board.board
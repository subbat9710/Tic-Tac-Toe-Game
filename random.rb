require_relative "board.rb"
require_relative "console.rb"
require_relative "human.rb"

class RandomPlayer
    attr_accessor :marker, :currentplayer, :name 

	def initialize(marker)
		@marker = marker
		@currentplayer = currentplayer
        @name = "RandomPlayer"
	end
    def get_move(board, currentplayer)
        position = rand(0..8)
        if board[position] != "" 
            get_move(board)
        else
          position
        end
    end
end
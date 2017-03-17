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
        end
    end
end
require_relative "board.rb"
require_relative "console.rb"

class Random
    attr_accessor :board, :current_player

    def initialize(marker)
   	    @marker = marker
   	    @current_player = current_player
   	end
   	def get_move(board, current_player)
   		random.rand(@board.get_size)
    end
end




# random = Random.new
# @board = ["x", "", "", "", "", "", "", "", ""]
# move = random.get_move
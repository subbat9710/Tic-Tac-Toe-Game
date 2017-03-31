class Sequential

	attr_accessor :marker, :name

	def initialize(marker)
		@marker = marker
		@name = "Sequential"
	end

	def get_move(board)
		move_position = board.board.index("")
    end
end
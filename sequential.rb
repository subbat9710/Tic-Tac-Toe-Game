class Sequential

	attr_accessor :marker, :name

	def initialize(marker)
		@marker = marker
		@name = "Sequential"
	end

	def get_move(board)
		move_position = board.index("")
    end
end
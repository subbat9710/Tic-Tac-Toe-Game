require "minitest/autorun"
require_relative "board.rb"
require_relative "console.rb"

class TestHuman < Minitest::Test

	def test_1_player1_play_first
		human = Human.new("x")
		board = Board.new
	    board.board = ["x", "", "1", "o", "", "", "", "", ""]
		assert_equal(1, human.get_move(board))
    end
end
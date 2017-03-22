require "minitest/autorun"
require_relative "unbeatable.rb"
require_relative "board.rb"

class TestUnbeatable < Minitest::Test

	def test_unbeatable_player_O
		ai = Unbeatable.new("O")
		assert_equal("O", ai.marker)
	end
	def test_position_zero_for_O
		ai = Unbeatable.new("O")
		board = ["", "x", "x", "o", "", "", "", "", ""]
		assert_equal(0, ai.get_move(board))
	end
end
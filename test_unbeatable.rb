require "minitest/autorun"
require_relative "unbeatable.rb"
require_relative "console.rb"

class TestUnbeatable < Minitest::Test

	def test_unbeatable_player_O
		ai = Unbeatable.new("O")
		assert_equal("O", ai.marker)
	end
	def test_position_zero_for_O
		ai = Unbeatable.new("o")
		board = ["", "o", "o", "o", "", "", "", "", ""]
		game = Console.new(board)
		assert_equal(0, ai.check_win(board, ai))
	end
	def test_position_one_for_O
		ai = Unbeatable.new("o")
		board = ["o", "", "x", "o", "x", "", "", "", ""]
		game = Console.new(board)
		assert_equal(6, ai.check_win(board, ai))
	end
	def test_position_one_for_block
		ai = Unbeatable.new("o")
		board = ["o", "o", "x", "o", "x", "o", "", "x", "x"]
		game = Console.new(board)
		assert_equal(6, ai.check_block(board, ai))
	end
end
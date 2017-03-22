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
	def test_position_six_for_block
		ai = Unbeatable.new("o")
		board = ["o", "o", "x", "o", "x", "o", "", "x", "x"]
		game = Console.new(board)
		assert_equal(6, ai.check_block(board, ai))
	end
    def test_position_one_for_block
		ai = Unbeatable.new("o")
		board = ["o", "", "x", "o", "x", "o", "o", "x", "x"]
		game = Console.new(board)
		assert_equal(1, ai.check_block(board, ai))
	end
	def test_position_eight_for_block
		ai = Unbeatable.new("o")
		board = ["o", "o", "x", "o", "x", "o", "x", "x", ""]
		game = Console.new(board)
		assert_equal(8, ai.check_block(board, ai))
	end
	def test_position_for_center
		ai = Unbeatable.new("o")
		board = ["o", "o", "", "", "", "x", "x", "o", "x"]
		game = Console.new(board)
		assert_equal(4, ai.check_center(board, ai))
	end
	def test_for_corner
		ai = Unbeatable.new("o")
		board = ["", "o", "x", "o", "x", "o", "o", "x", "x"]
		game = Console.new(board)
		assert_equal(0, ai.check_corner(board))
	end
	def test_for_second_corner
		ai = Unbeatable.new("o")
		board = ["x", "o", "", "o", "x", "o", "o", "x", "x"]
		game = Console.new(board)
		assert_equal(2, ai.check_corner(board))
	end
	def test_for_third_corner
		ai = Unbeatable.new("o")
		board = ["x", "o", "x", "o", "x", "o", "", "x", "x"]
		game = Console.new(board)
		assert_equal(6, ai.check_corner(board))
	end
	def test_for_fourth_corner
		ai = Unbeatable.new("o")
		board = ["x", "o", "x", "o", "x", "o", "o", "x", ""]
		game = Console.new(board)
		assert_equal(8, ai.check_corner(board))
	end
	def test_for_check_size
		ai = Unbeatable.new("o")
		board = ["x", "", "x", "o", "x", "o", "o", "x", "o"]
		game = Console.new(board)
		assert_equal(1, ai.check_size(board))
    end
    def test_for_second_check_size
		ai = Unbeatable.new("o")
		board = ["x", "o", "x", "", "x", "x", "o", "x", "o"]
		game = Console.new(board)
		assert_equal(3, ai.check_size(board))
    end
end
require "minitest/autorun"
require_relative "unbeatable.rb"

class TestUnbeatable < Minitest::Test

	def test_unbeatable_player_O
		ai = Unbeatable.new("O")
		assert_equal("O", ai.marker)
	end
	def test_position_zero_for_O
		ai = Unbeatable.new("o")
		board = ["", "o", "o", "o", "", "", "", "", ""]
		#game = Console.new(board, player1, player2)
		assert_equal(0, ai.check_win(board, ai))
	end
	def test_position_one_for_O
		ai = Unbeatable.new("o")
		board = ["o", "", "x", "o", "x", "", "", "", ""]
		assert_equal(6, ai.check_win(board, ai))
	end
	def test_position_six_for_block
		ai = Unbeatable.new("o")
		board = ["o", "o", "x", "o", "x", "o", "", "x", "x"]
		assert_equal(6, ai.block_win(board, ai))
	end
	def test_for_third_to_block_for_win
		ai = Unbeatable.new("o")
		board = ["o", "x", "o", "", "x", "x", "o", "o", "x"]
		assert_equal(3, ai.block_win(board, ai))
	end
    def test_position_one_for_block
		ai = Unbeatable.new("o")
		board = ["o", "", "x", "o", "x", "o", "o", "x", "x"]
		assert_equal(1, ai.block_win(board, ai))
	end
	def test_position_eight_for_block
		ai = Unbeatable.new("o")
		board = ["o", "o", "x", "x", "o", "o", "x", "x", ""]
		assert_equal(8, ai.block_win(board, ai))
	end
	def test_position_for_center
		ai = Unbeatable.new("o")
		board = ["o", "o", "", "", "", "x", "x", "o", "x"]
		assert_equal(4, ai.check_center(board))
	end
	def test_for_corner
		ai = Unbeatable.new("o")
		board = ["", "o", "x", "o", "x", "o", "o", "x", "x"]
		assert_equal(0, ai.check_corner(board))
	end
	def test_for_second_corner
		ai = Unbeatable.new("o")
		board = ["x", "o", "", "o", "x", "o", "o", "x", "x"]
		assert_equal(2, ai.check_corner(board))
	end
	def test_for_third_corner
		ai = Unbeatable.new("o")
		board = ["x", "o", "x", "o", "x", "o", "", "x", "x"]
		assert_equal(6, ai.check_corner(board))
	end
	def test_for_fourth_corner
		ai = Unbeatable.new("o")
		board = ["x", "o", "x", "o", "x", "o", "o", "x", ""]
		assert_equal(8, ai.check_corner(board))
	end
	def test_for_check_size
		ai = Unbeatable.new("o")
		board = ["x", "", "x", "o", "x", "o", "o", "x", "o"]
		assert_equal(1, ai.check_size(board))
    end
    def test_for_second_check_size
		ai = Unbeatable.new("o")
		board = ["x", "o", "x", "", "x", "x", "o", "x", "o"]
	    assert_equal(3, ai.check_size(board))
    end
    def test_for_third_check_size
		ai = Unbeatable.new("o")
		board = ["x", "o", "x", "o", "x", "", "o", "x", "o"]
		assert_equal(5, ai.check_size(board))
    end
    def test_for_fourth_check_size
		ai = Unbeatable.new("o")
		board = ["x", "o", "x", "o", "x", "o", "o", "", "o"]
		assert_equal(7, ai.check_size(board))
    end
    def test_for_check_diags
		ai = Unbeatable.new("o")
		board = ["x", "", "", "o", "x", "o", "", "x", "o"]
		assert_equal(1, ai.check_size(board))
    end
    def test_for_check_fork
		ai = Unbeatable.new("o")
		board = ["", "x", "", "", "o", "x", "", "", ""]
		assert_equal(2, ai.create_fork(board, ai))
	end
    def test_for_block_fork_size
		ai = Unbeatable.new("o")
		board = ["x", "", "", "", "o", "", "", "", "x"]
		assert_includes([1,3,5,7], ai.block_fork(board, ai))
    end
    def test_for_block_fork
    	ai = Unbeatable.new("o")
    	board = ["", "x", "", "", "o", "x", "", "", ""]
		assert_equal(2, ai.block_fork(board, ai))
	end
end
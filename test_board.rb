require "minitest/autorun"
require_relative "board.rb"

class TestBoard < Minitest::Test

	def test_for_a_board
		board = Board.new
		result = Array.new(9, "")
		assert_equal(result, board.board)
	end
	def test_2_update_first_position_with_x
		board = Board.new
		board.set_position(0, "x")
		result =["x", "", "", "", "","", "", "", ""]
		assert_equal(result, board.board)
    end
    def test_o_for_the_fifth_position
		board = Board.new
		board.set_position(0, "x")
		board.set_position(4, "o")
		result = ["x", "", "", "", "o","", "", "", ""]
		assert_equal(result, board.board)
    end
    def test_o_for_the_eighth_position_and_x_for_first
		board = Board.new
		board.set_position(0, "x")
		board.set_position(7, "o")
		result = ["x", "", "", "", "","", "", "o", ""]
		assert_equal(result, board.board)
    end
    def test_for_x_for_the_eight_position_o_at_fifth
		board = Board.new
        board.board = ["x", "", "", "", "o","", "", "", ""]
		board.set_position(7, "x")
        result = ["x", "", "", "", "o","", "", "x", ""]
		assert_equal(result, board.board)
    end
    def test_for_x_for_the_third_position_o_at_sixth
		board = Board.new
        board.board = ["x", "", "", "", "","o", "", "", ""]
		board.set_position(2, "x")
        result = ["x", "", "x", "", "","o", "", "", ""]
		assert_equal(result, board.board)
    end
    def test_for_0_for_7_position
		board = Board.new
        board.board = ["x", "", "", "", "","o", "", "", ""]
		board.set_position(7, "x")
        result = ["x", "", "", "", "","o", "", "x", ""]
		assert_equal(result, board.board)
    end
    def test_for_0_for_6_position
		board = Board.new
        board.board = ["x", "", "", "", "","o", "", "", ""]
		board.set_position(6, "x")
        result = ["x", "", "", "", "","o", "x", "", ""]
		assert_equal(result, board.board)
	end
    def test_for_spot_already_taken
		board = Board.new
        board.board = ["x", "", "", "", "o","", "", "", ""]
        result = board.check_position?(4)
		assert_equal(false, result)
    end
    def test_for_spot_is_open
		board = Board.new
        board.board = ["x", "", "", "", "o","", "", "", ""]
		result = board.check_position?(3)
		assert_equal(true, result)
    end
    def test_for_all_spot_full
    	board = Board.new
    	board.board = ["x", "o", "x", "x", "o", "x", "x", "x", "x"]
    	result = board.check_full?
    	assert_equal(true, result)
    end
    def test_full_board_equals_game_over
    	board = Board.new
    	board.board = ["x", "o", "o", "o", "o", "x", "x", "x", "x"]
    	result = board.check_full?
        assert_equal(true, result)
    end
    def test_board_is_almost_full
    	board = Board.new
    	board.board = ["x", "x", "o", "o", "o", "", "x", "x", "x"]
    	result = board.check_full?
    	assert_equal(false, result)
    end
    def test_empty_board
    	board = Board.new
    	board.board = ["", "", "", "", "", "", "", "", ""]
    	result = board.check_full?
    	assert_equal(false, result)
    end
    def test_for_winner_first_row
    	board = Board.new
    	board.board = [["x", "x", "x"], ["0", "", "o"], ["x", "o", "x"]]
    	result = board.stub_winner?
    	assert_equal(true, result)
    end
    def test_for_winner_second_row
    	board = Board.new
    	board.board = ["o", "x", "x", "o", "o", "o", "x", "o", "x"]
    	result = board.stub_winner?
    	assert_equal(true, result)
    end
    def test_for_winner_third_row
    	board = Board.new
    	board.board = ["x", "0", "", "0", "", "o", "x", "x", "x"]
    	result = board.stub_winner?
    	assert_equal(true, result)
    end
    def test_for_tie
    	board = Board.new
    	board.board = ["x", "0", "x", "o", "x", "x", "o", "x", "o"]
    	result = board.stub_winner?
    	assert_equal(true, result)
    end
end
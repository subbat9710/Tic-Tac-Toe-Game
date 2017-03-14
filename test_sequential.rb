require "minitest/autorun"
require_relative "sequential.rb"
require_relative "board.rb"

class TestSequential < Minitest::Test

	def test_1_sequential
		player = Sequential.new("x")
		board2 = Board.new
	    board = ["x", "", "", "", "o","", "", "", ""]
	    assert_equal(1, player.get_move(board))
	end
	def test_2_sequential
		player = Sequential.new("x")
		board2 = Board.new
	    board = ["x", "1", "2", "3", "o","", "", "", ""]
	    assert_equal(5, player.get_move(board))
	end
	def test_3_sequential
		player = Sequential.new("x")
		board2 = Board.new
	    board = ["x", "1", "2", "3", "o","4", "", "7", "8"]
	    assert_equal(6, player.get_move(board))
	end
	def test_4_sequential
		player = Sequential.new("x")
		board2 = Board.new
	    board = ["x", "1", "", "2", "o","3", "7", "4", "8"]
	    assert_equal(2, player.get_move(board))
	end
	def test_5_sequential
		player = Sequential.new("x")
		board2 = Board.new
	    board = ["x", "1", "2", "", "o","6", "8", "7", "5"]
	    assert_equal(3, player.get_move(board))
	end
	def test_6_sequential
		player = Sequential.new("x")
		board2 = Board.new
	    board = ["x", "1", "2", "3", "","5", "6", "7", "8"]
	    assert_equal(4, player.get_move(board))
	end
	def test_7_sequential
		player = Sequential.new("o")
		board2 = Board.new
		board = ["x", "1", "2", "3", "","5", "6", "7", "8"]
		assert_equal(4, player.get_move(board))
	end
	def test_8_sequential
		player = Sequential.new("o")
        board2 = Board.new
        board = ["o", "1", "", "3", "","5", "6", "7", "8"]
        assert_equal(2, player.get_move(board))
    end
end	
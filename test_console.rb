require "minitest/autorun"
require_relative "console.rb"
require_relative "board.rb"
require_relative "human.rb"

class TestConsole < Minitest::Test
	
    def test_name1_as_current_player
		board = Console.new(board)
		player = Player.new("Player1", "Player2")
		assert_equal("Player1", board.switch_player("Player2"))
	end
	def test_name2_as_current_player
		board = Console.new(board)
		player = Player.new("Player1", "Player2")
		assert_equal("Player2", board.switch_player("Player1"))
	end
end

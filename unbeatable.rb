require_relative "board.rb"

class Unbeatable
	attr_accessor :marker, :currentplayer

	def initialize(marker)
		@marker = marker
		@currentplayer = currentplayer
	end
	def get_move(board)
		if currentplayer.marker == "O"
			aiplayer = "X"
		else
			aiplayer = "O"
		end
    end
	def check_win(board, currentplayer)
		check_win(board, currentplayer)
	end
	def block_win(board, currentplayer)
		win_or_block(board, currentplayer)
	end
	def map_board(board)
		win_combinations = [
			                 [board[0], board[1], board[2]],
			                 [board[3], board[4], board[5]],
			                 [board[6], board[7], board[8]],
			                 [board[0], board[3], board[6]],
			                 [board[1], board[4], board[7]],
			                 [board[2], board[5], board[8]],
			                 [board[0], board[4], board[8]],
			                 [board[2], board[4], board[6]]
		                    ]
	    end
	def check_win(board, currentplayer)
		win_array = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        win_array1 = map_board(board)
		move = 1

		win_array1.each_with_index do |element, indx|
			# puts "#{element.inspect}"
			# puts "#{element.count(currentplayer.marker)}"
			if element.count(currentplayer.marker) == 2 && element.count("") == 1
				winner_or_block = element.index("")
				puts "#{winner_or_block}"
				move = win_array[indx][winner_or_block]
			end
		end
        move
	end
# 	def win_or_block(board, currentplayer)
# 		win_array = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
#         win_or_block_array = map_board(board)
# 		move = 1

# 		win_or_block_array.each_with_index do |element, indx|
# 			# puts "#{element.inspect}"
# 			# puts "#{element.count(currentplayer.marker)}"
# 			if element.count(currentplayer.marker) == 2 && element.count("") == 1
# 				winner_or_block = element.index("")
# 				puts "#{winner_or_block}"
# 				move = win_array[indx][winner_or_block]
# 			end
# 		end
#         move
# 	end
# end
end




























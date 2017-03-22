require_relative "board.rb"

class Unbeatable
	attr_accessor :marker, :currentplayer, :corner, :size, :center, :diags, :board

	def initialize(marker)
		@corner = [0,2,6,8]
		@size = [1,3,5,7]
		@center = [4]
		@diags = [[2,6],[0,8]]
		@marker = marker
		@currentplayer = currentplayer
		@board = board 
    end
	def get_move(board)
        if check_win(board, currentplayer) < 10
        	move = check_win(board, currentplayer)
        elsif check_block(board, currentplayer) < 10 
        	move = check_block(board, currentplayer)
        elsif check_corner(board) < 10
        	move = check_corner(board)
        elsif check_center(board, currentplayer) < 10
        	move = check_center(board)
        elsif check_diags(board) < 10
        	move = check_diags(board)
        else check_size(board) < 10
        	move = check_size(board)
        end
        move
    end

	def map_board(board)
		win_array1 = [
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
		move = 10

		win_array1.each_with_index do |element, indx|
			if element.count(marker) == 2 && element.count("") == 1
				winner_or_block = element.index("")
				puts "#{winner_or_block}"
				move = win_array[indx][winner_or_block]
			end
		end
        move
	end
 	def check_block(board, currentplayer)
 		win_array = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        win_array1 = map_board(board)
 		move = 10
 		if marker == "o"
			other_player = "x"
		else
			other_player = "o"
		end

 		win_array1.each_with_index do |element, indx|
 			# puts "#{element.inspect}"
 			# puts "#{element.count(currentplayer.marker)}"
 			if element.count(other_player) == 2 && element.count("") == 1
 				winner_or_block = element.index("")
 				puts "#{winner_or_block}"
 				move = win_array[indx][winner_or_block]
 			end
 		end
         move
 	end
 	def check_center(board, center) 
        move = 10
        if board[4] == ""
        	move = 4
        end
    end
    def check_corner(board)
    	move = 10
    	corner.each do |element|
    		if board[element] == ""
    			move = element
    		end
    	end
    	move
    end
    def check_size(board)
    	move = 10
    	size.each do |element|
    		if board[element] == ""
    			move = element
    		end
    	end
    	move
    end
    def check_diags(board)
    	move = 10
    	diags.each do |element|
    		element.each do |indx|
    			if board[indx] == ""
    				move = indx
    			end
    		end
    	end
    	move
    end
end













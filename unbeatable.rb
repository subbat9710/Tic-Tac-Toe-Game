require_relative "board.rb"

class Unbeatable
	attr_accessor :marker, :currentplayer, :corner, :size, :center, :diags, :board, :name

	def initialize(marker)
		@corner = [0,2,6,8]  #corner board positions 
		@size = [1,3,5,7]    #size board positions
		@center = [4]        #center position
		@diags = [[2,6],[0,8]] #diagonals positions
		@marker = marker
		@currentplayer = currentplayer
		@board = board 
		@name = "Unbeatable"  #if unbeatable wins the game the, "unbeatable won the game"=>result
    end
	def get_move(board)  #loop for all the positions to move in available positions
        if check_win(board, currentplayer) < 10
        	move = check_win(board, currentplayer)
        elsif check_block(board, currentplayer) < 10 
        	move = check_block(board, currentplayer)
        elsif check_fork(board, currentplayer) < 10
         	move = check_fork(board, currentplayer)
        elsif block_fork(board, currentplayer) < 10
         	move = block_fork(board, currentplayer)
        elsif check_corner(board) < 10
        	move = check_corner(board)
        elsif check_center(board) < 10
        	move = check_center(board)
        elsif check_diags(board) < 10
        	move = check_diags(board)
        else check_size(board) < 10
        	move = check_size(board)
        end
        move
    end

	def map_board(board)  #map board for win arrays
		win_array1 = [
			            [board.board[0], board.board[1], board.board[2]],
			            [board.board[3], board.board[4], board.board[5]],
			            [board.board[6], board.board[7], board.board[8]],
			            [board.board[0], board.board[3], board.board[6]],
			            [board.board[1], board.board[4], board.board[7]],
			            [board.board[2], board.board[5], board.board[8]],
			            [board.board[0], board.board[4], board.board[8]],
			            [board.board[2], board.board[4], board.board[6]]
		                   ]
	end

	def check_fork(board, currentplayer)
		win_array = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
		win_array1 = map_board(board)
		fork_size = []
		move = 10
        win_array1.each_with_index do |element, indx|
			if element.count(marker) == 1 && element.count("") == 2
                create_or_block = element.index("")
				move = win_array[indx][create_or_block]		
			end
			   #  puts "#{move.inspect}"
		end
	    move
	end
	def block_fork(board, currentplayer)
		block_win_array = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
		block_win_array1 = map_board(board)
		move = 10
		if marker == "o"
			other_player = "x"
		else
			other_player = "o"
		end
		diags.each do |element|
	    	count = 0
	    	element.each do |indx|
	    		#puts "#{board.inspect}"
	    		if board.board[indx] == other_player
	    			#puts "#{marker}" #check for marker =>("o")
                    count += 1
                end
                if count == 2
                	move = check_size(board)
                end
                #puts "#{move}" #check for the move
            end
            move
        end
        if move == 10
		    block_win_array1.each_with_index do |block_element, indx|
			    if block_element.count(other_player) == 1 && block_element.count("") == 2
				    create_or_block = block_element.index("")
				    move = block_win_array[indx][create_or_block]
			    end
			    #puts "#{move.inspect}"
		    end
	    end
	    move
    end

    #checks for posible wins
	def check_win(board, currentplayer)
		win_array = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        win_array1 = map_board(board)
		move = 10

		win_array1.each_with_index do |element, indx|
			if element.count(marker) == 2 && element.count("") == 1
				winner_or_block = element.index("")
				#puts "#{winner_or_block}"
				move = win_array[indx][winner_or_block]
			end
		end
        move
	end
	#blocks the posible wins
 	def check_block(board, currentplayer)
 		win_array = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        win_array1 = map_board(board)
 		move = 10
 		if marker == "X"
			other_player = "X"
		else
			other_player = "O"
		end

 		win_array1.each_with_index do |element, indx|
 			# puts "#{element.inspect}"
 			# puts "#{element.count(currentplayer.marker)}"
 			if element.count(other_player) == 2 && element.count("") == 1
 				winner_or_block = element.index("")
 				#puts "#{winner_or_block}"
 				move = win_array[indx][winner_or_block]
 			end
 		end
         move
 	end
 	def check_center(board) 
        move = 10
        if board.board[4] == ""  
        	move = 4
        end
        move
    end
        
    def check_corner(board)
    	move = 10
    	corner.each do |element|
    		if board.board[element] == ""
    			move = element
    		end
    	end
    	move
    end
    def check_size(board)
    	move = 10 
    	size.each do |element|
    		if board.board[element] == ""
    			move = element
    		end
    	end
    	move
    end
    def check_diags(board)
    	move = 10
    	diags.each do |element|
    		element.each do |indx|
    			if board.board[indx] == ""
    				move = indx
    			end
    		end
    	end
    	move
    end
end

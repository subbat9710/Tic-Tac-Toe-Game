board = ["", "", "x", "", "o", "x", "", "x", ""]
open_position = []
board.each_index do |board_index|
	if board[board_index] == ""
		open_position.push(board_index)
	end
end

p open_position #[0,1,3,6,8]


    	#position = rand(0..8)
     #    if board.board[position] != "" 
     #        puts "#{board.board}"
     #        move(board, currentplayer)
    	# else
    	# 	position
     #        if rand(2) == 1
    	# end
    	#     position
     #    end
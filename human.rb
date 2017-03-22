class Player
    attr_accessor :name, :marker

    def initialize(name, marker)
    	@marker = marker
    	@name = name
    end
    def get_move(board)
    	puts "#{name}, pick a space"
    	move = gets.chomp.to_i
    	if board[move] == ""
    		move
    	else
    		puts "invalid space"
    		get_move(board)
    	end
    end
end
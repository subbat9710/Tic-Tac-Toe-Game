require_relative "board.rb"
require_relative "sequential.rb"
require_relative "board_player.rb"

class Console
	#attr_accessor :board, :player, :player1, :player2, :currentplayer

	def initialize 
		#@board = Board.new
		#@player = Player.new("Player1", "Player2")
   
	end

	def display_board(board)  #drawing a board 
		puts "\n
		    #{board[0]}  |  #{board[1]}  |  #{board[2]}\n
		    -------------
		    #{board[3]}  |  #{board[4]}  |  #{board[5]}\n
		    -------------
		    #{board[6]}  |  #{board[7]}  |  #{board[8]}\n\n"  
    end 
    


    def switch_player(currentplayer)
    	if currentplayer == player.name1
    	   currentplayer = player.name2
    	else
    	   currentplayer = player.name1
    	end	
    end
    def get_move(move)
    	#currentplayer.get_move(board)

    end
    def game_over?
    	board.stub_winner? || (stub_winner? == false && check_full? == true)
    end
    def game_status  #check for game, if currentplayer wins then win otherwise tie.
    	if board.stub_winner?
    		puts "#{currentplayer} you won"
    	else 
    		puts "tie"
    	end
    end
    def check(pick, currentplayer) #check pick spot for availability
        if board[pick] == pick + 1
            board[pick] = currentplayer.marker
            true
        else
            false
        end
    end
    #check if currentplayer has won game
    # def win (currentplayer)
    #     wins = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,9],[0,4,8],[2,4,6]]
    #     wins.each do |index|
    #         temp = currentplayer.picked & index
    #         temp.to_s.length == 9 ? (return true) : false
    #     end
    # end
end
    # console = Console.new
    # board = Board.new
    # board.set_position(1, "x")
    # #p board.board 

    # console.display_board(board.board)
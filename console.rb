require_relative "board.rb"
require_relative "sequential.rb"
require_relative "human.rb"
require_relative "random.rb"
require_relative "unbeatable.rb"

class Console
	attr_accessor :board, :name, :currentplayer, :player1, :player2

	def initialize(board, player1, player2)
	    @board = board
	 	@player1 = player1
        @player2 = player2
        @currentplayer = player2
    end

	def display_board(board)  #display the whole tictactoe board 
		puts "\n
		     #{board[0]}  |  #{board[1]}  |  #{board[2]}\n
		     -------------
		     #{board[3]}  |  #{board[4]}  |  #{board[5]}\n
		     -------------
		     #{board[6]}  |  #{board[7]}  |  #{board[8]}\n\n"  
    end 
    
    def switch_player(currentplayer)
    	if @currentplayer == player1
    	   @currentplayer = player2
    	else
    	   @currentplayer = player1
    	end	
    end
    def get_move(board)
      	@currentplayer.get_move(board)
    end
 
    def game_over?
    	@board.stub_winner? || (@board.stub_winner? == false && @board.check_full? == true)
    end
    def game_status  #check for game, if currentplayer wins then win otherwise tie.
    	if board.stub_winner?
    		puts "#{currentplayer.name}, you won"
    	else
    		puts "Game is tie"
    	end
    end
end
    # console = Console.new
    # board = Board.new
    # board.set_position(1, "x")
    # #p board.board 

    # console.display_board(board.board)
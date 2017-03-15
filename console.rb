require_relative "board.rb"
require_relative "sequential.rb"
require_relative "board_player.rb"

class Console
	attr_accessor :board, :player, :player1, :player2, :currentplayer

	def initialize(board)
		@board = board
		@player = Player.new("Player1", "Player2")
   
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
    	if currentplayer == player.name1
    	   currentplayer = player.name2
    	else
    	   currentplayer = player.name1
    	end	
    end
    #def get_move(move)
    #	currentplayer.get_move(board)
    # def move(currentplayer, marker)
    #     valid = false
    #     while valid == false
    #         puts "#{currentplayer}, Your turn."
    #         set_position = gets.chomp.downcase
    #         if set_position == 'exit'
    #             puts "Exiting game."
    #             return exit
    #         elsif not set_position.match /[abc][123]/
    #             puts "not valid input."
    #             sleep 1
    #         elsif @board[set_position] != '-'
    #             puts 'Already something there'
    #             sleep 1
    #         else
    #             valid = true
    #             @board[set_position] = marker
    #         end
    #     end
    # end
 
    def game_over?
    	@board.stub_winner? || (@board.stub_winner? == false && @board.check_full? == true)
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
end
    # console = Console.new
    # board = Board.new
    # board.set_position(1, "x")
    # #p board.board 

    # console.display_board(board.board)
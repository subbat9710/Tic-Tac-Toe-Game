require 'sinatra'
require_relative 'board.rb'
require_relative 'human.rb'
require_relative 'sequential.rb'
require_relative 'random.rb'
require_relative 'unbeatable.rb'

enable :sessions

    get '/' do 
	    session[:board] = Board.new
	    erb :tictactoe, :locals => {:board => session[:board].board}
	end

	get "/playervsplayer" do 
		session[:player1] = Player.new("Player1", "X")
		session[:player2] = Player.new("Player2", "O")
		session[:currentplayer] = session[:player1]
		game_msg = "Human Vs Human. Player1, select your play:"

		erb :get_human, :locals => {:game_msg => game_msg, :board => session[:board].board}
	end

	get "/playervsseq" do
		session[:player1] = Player.new("Player1", "X")
		session[:player2] = Sequential.new("O")
		session[:currentplayer] = session[:player1]
		game_msg = "Human Vs Sequential. Player1, select your play"

		erb :get_human, :locals => {:game_msg => game_msg, :board => session[:board].board}
	end

	get "/playervsrandom" do 
		session[:player1] = Player.new("Player1", "X")
		session[:player2] = RandomPlayer.new("O")
		session[:currentplayer] = session[:player1]
		game_msg = "Human Vs RandomPlayer. Player1, select your play"

        erb :get_human, :locals => {:game_msg => game_msg, :board => session[:board].board}
    end

    post '/name' do
        name = params[:Player1]
    end

    get "/playervsunbeatable" do 
    	session[:player1] = Player.new("name", "X")
    	session[:player2] = Unbeatable.new("O")
    	session[:currentplayer] = session[:player1]
    	game_msg = "Human Vs Computer. Player1, select your play"

    	erb :get_human, :locals => {:game_msg => game_msg, :board => session[:board].board}
    end

    def switch_player(currentplayer)
    	if session[:currentplayer] == session[:player1]
    		session[:currentplayer] = session[:player2]
    	else
    		session[:currentplayer] = session[:player1]
    	end
    end

    get "/request_human_move" do 
     	game_msg = "#{session[:currentplayer].name} , #{session[:currentplayer].marker} Select your play:"

     	erb :get_human, :locals => {:game_msg => game_msg, :board => session[:board].board}
    end

    post "/get_human_move" do 
    	move = params[:move].keys.join.to_i
    	if session[:board].board[move] == ""
            #puts "move#{move.class}" to check for the board move               
    		move = move 
    	    redirect "/update_board?move=#{move}"
    	else
    		game_msg = "#{session[:currentplayer].name} @ #{session[:currentplayer].marker}"
            erb :get_human, :locals => {:game_msg => game_msg, :board => session[:board].board}	
        end
    end

    get "/update_board" do 
        move = params[:move].to_i
        session[:board].set_position(move, session[:currentplayer].marker)
        if session[:board].stub_winner? || session[:board].tie
            puts "update_board#{session[:board].stub_winner?}"
            redirect "/display_result"
        else
            redirect "/switch_player"
        end
    end

    get "/get_move" do 
        if session[:currentplayer].class == Player
            redirect "/request_human_move"
        elsif session[:currentplayer].class != Player
            move = session[:currentplayer].get_move(session[:board])
        end
        redirect "/update_board?move=#{move}"
    end

    get "/switch_player" do 
        if session[:currentplayer] == session[:player1]
            session[:currentplayer] = session[:player2]
        else
            session[:currentplayer] = session[:player1]
        end
            redirect "/get_move"
    end  

    get "/display_result" do 
        if session[:board].stub_winner?
            #puts "wins"
            game_msg = "\tWow! #{session[:currentplayer].name}(#{session[:currentplayer].marker})WINS ^_^"
        erb :display_win, :locals => {:game_msg => game_msg, :board => session[:board].board}
        else session[:board].tie
    	    game_msg = "\tDRAW!, Try Again"
        erb :display_result, :locals => {:game_msg => game_msg, :board => session[:board].board}
        end
    end
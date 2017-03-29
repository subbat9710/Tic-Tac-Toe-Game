require 'sinatra'
require_relative 'board.rb'
require_relative 'human.rb'
require_relative 'sequential.rb'
require_relative 'random.rb'
require_relative 'unbeatable.rb'

enable :sessions

    get "/" do 
	    session[:board] = Board.new
	    erb :tictactoe, :locals => {:game_msg => "", :board => session[:board].board}
	end

	get "/playervsplayer" do 
		session[:player1] = Player.new("X", "Player1")
		session[:player2] = Player.new("O","Player2")
		session[:currentplayer] = session[:player1]
		game_msg = "Human Vs Human. Player1, select your play"
		game_err = ""

		erb :get_human, :locals => {:game_msg => game_msg, :game_err => game_err, :board => session[:board].board}
	end

	get "/playervsseq" do
		session[:player1] = Player.new("X", "Player1")
		session[:player2] = Sequential.new("O")
		session[:currentplayer] = session[:player1]
		game_msg = "Human Vs Sequential. Player1, select your play"
		game_err = ""

		erb :get_human, :locals => {:game_msg => game_msg, :game_err => game_err, :board => session[:board].board}
	end

	get "/playervsrandom" do 
		session[:player1] = Player.new("X", "Player1")
		session[:player2] = RandomPlayer.new("O")
		session[:currentplayer] = session[:player1]
		game_msg = "Human Vs RandomPlayer. Player1, select your play"
		game_err = ""

        erb :get_human, :locals => {:game_msg => game_msg, :game_err => game_err, :board => session[:board].board}
    end

    get "/playervsunbeatable" do 
    	session[:player1] = Player.new("X", "Player1")
    	session[:player2] = Unbeatable.new("O")
    	session[:currentplayer] = session[:player1]
    	game_msg = "Human Vs Computer. Player1, select your play"
    	game_err = ""

    	erb :get_human, :locals => {:game_msg => game_msg, :game_err => game_err, :board => session[:board].board}
    end

    def switch_player(currentplayer)
    	if session[:currentplayer] == session[:player1]
    		session[:currentplayer] = session[:player2]
    	else
    		session[:currentplayer] = session[:player1]
    	end
    end

    get "/request_human_move" do 
    	game_msg = "#{session[:currentplayer].name} @ #{session[:currentplayer].marker} Select next"
    	game_err = ""

    	erb :get_human, :locals => {:game_msg => game_msg, :game_err => game_err, :board => session[:board].board}
    end

    post "/get_human_move" do 
    	move = params[:move]
    	if move.to_i > 0
    		move = move.to_i - 1
    	    redirect "/update_board?move=#{move}"
    	else
    		game_msg = "#{session[:currentplayer].name} @ #{session[:currentplayer].marker}"
    		game_err = "Selected space already taken. Try again"
            erb :get_human, :locals => {:game_msg => game_msg, :game_err => game_err, :board => session[:board].board}	
        end
    end

    get "/get_move" do 
    	if session[:currentplayer].class == Human
    		redirect "/request_human_move"
    	elsif session[:currentplayer].class != Human
    		move = session[:currentplayer].get_move(session[:board], session[:currentplayer])
    	end
    	redirect "/update_board?move=#{move}"
    end

    get "/update_board" do 
    	move = params[:move].to_i
    	session[:board].update_move(move, session[:currentplayer].marker)
    	if session[:board].stub_winner? || session[:board].tie
    		redirect "/display_result"
    	else
    		redirect "/change_player"
    	end
    end
    
    def switch_player(currentplayer)
    	if session[:currentplayer] == session[:player1]
    		session[:currentplayer] = session[:player2]
    	else
    		session[:currentplayer] = session[:player1]
    	end
    	redirect "/get_move"
    end

    get "/display_result" do 
        if session[:board].stub_winner?
            game_msg = "\tHurray! #{session[:currentplayer].name} @ #{session[:currentplayer].marker} wins"
        erb :display_win, :locals => {:game_msg => game_msg, :board => session[:board].board}
        elsif session[:board].tie
    	    game_msg = "\tIt was tie!"
        erb :display_result, :locals => {:game_msg => game_msg, :board => session[:board].board}
        else
    	game_msg = "Try again"
        end
    end
require 'sinatra'
require_relative 'board.rb'
require_relative 'human.rb'
require_relative 'sequential.rb'
require_relative 'random.rb'
require_relative 'unbeatable.rb'

class TicTacToeApp < Sinatra::Base

enable :sessions

    get "/" do 
	    session[:board] = TTTboard.new
	    erb :tictactoe, :locals => {:game_msg => "", :board => session[:board].board}
	end

	get "/playervsplayer" do 
		session[:player1] = Human.new("x", "Player1")
		session[:player2] = Human.new("o","Player2")
		session[:currentplayer] = session[:player1]
		game_msg = "Human Vs Human. Player 1, select your play"
		game_err = ""

		erb :get_human, :locals => {:game_msg => game_msg, :game_err => game_err, :board => session[:board].board}
	end

	get "/playervsseq" do
		session[:player1] = Human.new("x", "Player1")
		session[:player2] = Sequential.new("o")
		session[:currentplayer] = session[:player1]
		game_msg = "Human Vs Computer. Player1, select your play"
		game_err = ""

		erb :get_human, locals => {:game_msg => game_msg, :game_err => game_err, :board => session[:board].board}
	end

	get "/playervsrandom" do 
		session[:player1] = Human.new("x", "Player1")
		session[:player2] = RandomPlayer.new("o")
		session[:currentplayer] = session[:player1]
		game_msg = "Human Vs RandomPlayer. Player1, select your play"
		game_err = ""

        erb :get_human, locals => {:game_msg => game_msg, :game_err => game_err, :board => session[:board].board}
    end

    get "/playervsunbeatable" do 
    	session[:player1] = Human.new("x", "Player1")
    	session[:player2] = Unbeatable.new("o")
    	session[:currentplayer] = session[:player1]
    	game_msg = "Human Vs Genius Computer. Player1, select your play"
    	game_err = ""

    	erb :get_human, locals => {:game_msg => game_msg, :game_err => game_err, :board => session[:board].board}
    end

    get "/randomvsrandom" do 
    	session[:player1] = RandomPlayer.new("x")
    	session[:player2] = RandomPlayer.new("o")
    	session[:currentplayer] = session[:player1]
    	game_msg = "Random Vs Random. Click Move button to start"

    	erb :get_random, :locals => {:game_msg => game_msg, :board => session[:board].board}
    end

    get "/seqvsseq" do 
    	session[:player1] = Sequential.new("x")
    	session[:player2] = Sequential.new("o")
    	session[:currentplayer] = session[:player1]
    	game_msg = "Sequential Vs Sequential. Click Move button to start"
      
        erb :get_random, :locals => {:game_msg => game_msg, :board => session[:board].board}
    end

    get "/seqvsunbeatable" do 
    	session[:player1] = Sequential.new("x")
    	session[:player2] = Unbeatable.new("o")
    	session[:currentplayer] = session[:player1]
    	game_msg = "Sequence Vs Unbeatable. Click Move button to start"

    	erb :get_random, :locals => {:game_msg => game_msg, :board => session[:board].board}
    end

    get "/ranvsunbeatable" do 
    	session[:player1] = RandomPlayer.new("x")
    	session[:player2] = Unbeatable.new("o")
    	session[:currentplayer] = session[:player1]
    	game_msg = "RandomPlayer Vs Unbeatable. Click move button to start"

    	erb :get_random, :locals => {:game_msg => game_msg, :board => session[:board].board}
    end
    
    get "/unbeatablevsunbeatable" do 
    	session[:player1] = Unbeatable.new("x")
    	session[:player2] = Unbeatable.new("o")
    	session[:currentplayer] = session[:player1]
    	game_msg = "Unbeatable Vs Unbeatable. Click move button to start"

    	erb :get_random, :locals => {:game_msg => game_msg, :board => session[:board].board}
    end

    post "/get_random_move" do 
    	move = session[:currentplayer].get_move(session[:board], session[:currentplayer])
    	session[:board].update_move(move, session[:currentplayer].marker)
    	if session[:board].stub_winner? || session[:board].tie
    		redirect "/display_result"
    	end
    	session[:currentplayer] = change_player(session[:currentplayer])
    	game_msg = "Click Move button to next"

        erb :get_random, :locals => {:game_msg => game_msg, :board => session[:board].board}
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
        erb :display_win, locals => {:game_msg => game_msg, :board => session[:board].board}
        elsif session[:board].tie
    	    game_msg = "\tIt was tie!"
        erb :display_result, locals => {:game_msg => game_msg, :board => session[:board].board}
        else
    	game_msg = "Try again"
        end
    end
end
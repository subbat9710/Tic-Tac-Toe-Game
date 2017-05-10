require_relative "board.rb"
require_relative "console.rb"
require_relative "human.rb"

#to run the game
board = Board.new
puts 'Wellcome. Player1, what is your name?'
name = gets.chomp
player1 = Player.new(name, 'x') 
puts "Hey, #{name}. Your symbol is 'X'"
sleep 1
puts 'Player2, what is your name?'
marker = gets.chomp
player2 = Player.new(marker, 'o')
puts "Hey, #{marker} Your symbol is 'O'"
sleep 1
currentplayer = player1
console = Console.new(board, player1, player2) 
console.display_board(board.board) #this line display the board in the terminals.
while !console.game_over? 
    print "#{name}, enter your move: "
 	move = gets.chomp.to_i
	board.set_position(move, "X")
	console.display_board(board.board)
    sleep 1
    if console.game_over?
        break
    end
    print "#{marker}, enter your move: " 
    move = gets.chomp.to_i
    board.set_position(move, "O")
    console.display_board(board.board)
    end
    if board.winner_of_game == "X"
        puts "#{name} you won, Congratulations!"
        exit
    elsif board.winner_of_game == "O"
        puts "#{marker} you won, Congratulations!" 
        exit
    else
        puts "Game is in tie, Try Again ^_^ "
        exit
    end

 #This is the another way to play in the consloe between player vs player. 





 # console = Console.new
 #     board = Board.new
 #     board.set_position(1, "x")
 #     p board.board 

 #     console.display_board(board.board)
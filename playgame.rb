require_relative "board.rb"
require_relative "console.rb"
require_relative "sequential.rb"
require_relative "board_player.rb"
require_relative "random.rb"

#to run the game
board = Board.new
puts 'Wellcome. Player1, what is your name?'
name1 = gets.chomp
player1 = Player.new(name1, 'x')
puts "Hey, #{name1}. Your symbol is 'x'"
sleep 1
puts 'Player2, what is your name?'
name2 = gets.chomp
player2 = Player.new(name2, 'o')
puts "Hey, #{name2} Your symbol is 'o'"
sleep 1
currentplayer = player1
console = Console.new(board) 
#random = Random.new
console.display_board(board.board) #this line display the board in the terminals.
 while !console.game_over? 
    print "#{name1}, enter your move: "
 	move = gets.chomp.to_i  
	#move = random.move
	board.set_position(move, "x")
	console.display_board(board.board)
    sleep 1
    #console.display_board(board.board)
    if console.game_over?
        break
    end
    print "#{name2}, enter your move: " 
    move = gets.chomp.to_i
    board.set_position(move, "o")
    console.display_board(board.board)
    
end
    if board.winner_of_game = "x"
      puts "#{name1}"
  else 
    puts "#{name2}"
end


 # console = Console.new
 #     board = Board.new
 #     board.set_position(1, "x")
 #     p board.board 

 #     console.display_board(board.board)
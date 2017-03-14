require_relative "board.rb"
require_relative "sequential.rb"
require_relative "console.rb"
require_relative "random.rb"

#to run the game
board = Board.new
puts 'Wellcome. Player1, what is your name?'
name1 = gets.chomp
player1 = Player.new(name1, 'X')
puts "Hey, #{name1}. Your symbol is 'X'"
sleep 1
puts 'Player2, what is your name?'
name2 = gets.chomp
player2 = Player.new(name2, 'O')
puts "Hey, #{name2} Your symbol is 'O'"
sleep 1
currentplayer = player1
console = Console.new  
#random = Random.new
	loop do console.display_board(board.board)
	print "#{name1}, enter your move: "
	move = gets.chomp.to_i  
	#move = random.move
	board.set_position(move, "X")
	console.display_board(board.board)
    sleep 1
    #console.display_board(board.board)
    print "#{name2}, enter your move: "
    move = gets.chomp.to_i
    board.set_position(move, "O")
    #console.display_board(board.board)
end

# console = Console.new
#     board = Board.new
#     board.set_position(1, "x")
#     #p board.board 

#     console.display_board(board.board)
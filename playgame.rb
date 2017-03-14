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

until game_over?
end
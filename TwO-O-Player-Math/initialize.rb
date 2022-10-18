require './players.rb'
require './game.rb'

#get player names and init players into the game, assigns them to p1 and p2
puts "Player 1, enter your name?"
p1name = gets.chomp
player1 = Player.new(p1name)
puts "Player 2, enter your name?"
p2name = gets.chomp
player2 = Player.new(p2name)

#start game loop
game = Game.new(player1, player2)
game.start
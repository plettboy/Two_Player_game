require './players.rb'

class Game
  def initialize(p1, p2)
    @current_player = true
    @p1 = p1
    @p2 = p2
    @game_over = false

    puts "Starting new game.."
  end

  #run game, while gameover != true
  def start()
    while @game_over == false

      #run generate_question
      if @current_player == true
        self.generate_question(@p1)
      else
        self.generate_question(@p2)
      end

      #check status of @game_over
      if @game_over != false
        self.game_over()
      else
        #if game not over, switch current player and continue game loop to next turn
        puts "---NEW TURN---"
        @current_player = !@current_player
      end
    end    
  end

#question generator
  def generate_question(player)
    #create random numbers
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @operators = [:+, :-, :*, :/]
    #gets an operator from the array
    @operator = @operators.sample()
    @answer = @num1.send(@operator, @num2)
   
    puts "#{player.name}: what does #{@num1} #{@operator} #{@num2} equal?"


    @input = gets.chomp

    #if answer is incorrect, subtract from score
    if @input.to_i == @answer
      puts "#{player.name}: correct!"
      puts "#{@p1.name}: #{@p1.score}/3 --- #{@p2.name}: #{@p2.score}/3"
    else
      puts "#{player.name}: wrong!"
      player.score -= 1
      puts "#{@p1.name}: #{@p1.score}/3 --- #{@p2.name}: #{@p2.score}/3"
    end

    #if player score = 0, end the game by calling game_over
    if player.score  == 0
      @game_over = true
    end
  end


  def game_over()
    if @current_player == true
      puts "Player 2 wins, score:  #{@p2.score}/3"
    else
      puts "Player 1 wins, score: #{@p1.score}/3"
    end

    puts "-<-<-<-GAME OVER->->->-"
  end

end

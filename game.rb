require_relative 'question' 
require_relative 'players'

class Game

  def initialize()
    @player_one = Players.new("Player One")
    @player_two = Players.new("Player Two")
    @math = Question.new("one", "two", "answer")
    @current_player = @player_one
    @game_over = false
  end

  def start

    while @game_over == false

      @math.number_generator
      puts "#{@current_player.name}, its your turn!"
      @math.user_prompt

      if gets.chomp.to_i == @math.answer
        puts "You got the right answer!"
      else
        puts "Wrong answer! You lost a life!"
        @current_player.lose_lives
        puts "#{@current_player.name}, You have #{@current_player.lives} lives remaining"
      end

      puts "P1: #{@player_one.lives}/3 vs P2: #{@player_two.lives}/3"

      #check if current player is alive

      if @current_player.lives == 0
        @game_over = true
        winner = check_winner
        puts "Game over! The winner is #{winner.name}"
      else 
        rotate_player
      end
    end
  end

  def rotate_player
    if @current_player.name == @player_one.name
      @current_player = @player_two
    else 
      @current_player = @player_one
    end
  end

  def check_winner
    if @current_player.name == @player_one.name
      @player_two
    else 
      @player_one
    end
  end

end
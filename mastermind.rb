require "./code_breaker.rb"
require "./code_maker.rb"
require "./game.rb"

class Mastermind
  attr_accessor :correct, :position, :guesses_remaining
  def initialize
    system ('clear')
    @@guesses_remaining = 12

    @game = Game.new
    game_intro
  end

  def game_intro
    puts "Welcome to"

    puts "     __  __            _                     _           _
    |  \\/  | __ _  ___| |_  ___  _ _  _ __  (_) _ _   __| |
    | |\\/| |/ _` |(_-<|  _|/ -_)| '_|| '  \\ | || ' \\ / _` |
    |_|  |_|\\__,_|/__/ \\__|\\___||_|  |_|_|_||_||_||_|\\__,_|"
    puts " "
    puts "CHOOSE YOUR GAME:"
    puts " "
    puts "CODE BREAKER"
    puts "You get 12 attempts to break the secret code"
    puts "and prove yourself to be a MASTERMIND."
    puts "After each guess, you will see how many digits"
    puts "are in the correct position"
    puts "or are correct, but out of position."
    puts " "
    puts "CODE MAKER"
    puts "Choose your 4 digit code and make the computer guess!"
    puts " "
    game_choose = "Type 'make' to make your code and have the computer guess. Type 'break' to guess the randomly generated code."
    puts game_choose
    game_type = gets.chomp.downcase
    until game_type == "make" || game_type == "break"
      puts game_choose
      game_type = gets.chomp.downcase
    end
    if game_type == "make"
      play_maker
    elsif game_type == "break"
      play_breaker
    end
  end
end



Mastermind.new

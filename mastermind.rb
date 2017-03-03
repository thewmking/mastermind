class Mastermind
  attr_accessor :guess
  def initialize
    system ('clear')
    puts "Welcome to"
    puts "  __  __            _                     _           _
 |  \\/  | __ _  ___| |_  ___  _ _  _ __  (_) _ _   __| |
 | |\\/| |/ _` |(_-<|  _|/ -_)| '_|| '  \\ | || ' \\ / _` |
 |_|  |_|\\__,_|/__/ \\__|\\___||_|  |_|_|_||_||_||_|\\__,_|"
    puts "You get 12 attempts to break the secret code"
    puts "and prove yourself to be a MASTERMIND."
    puts "After each guess, you will see how many digits"
    puts "are in the correct position"
    puts "or are correct, but out of position."
    @player = Player.new
    @game = Game.new
    play
  end

  def play
    puts "Enter your guess. Choose 4 digits from 1 to 6."
    @guess = gets.chomp
    while (@guess.length != 4) || !(@guess =~ /[1-6]{4}/)
      puts "Guess must be 4 digits from 1-6"
      @guess = gets.chomp
    end
    @guess = @guess.split("")
    if Game.check(@guess)
      play
    end
  end
end

class Game
  attr_accessor :correct, :position, :guesses_remaining

  def initialize
    @@guesses_remaining = 12
    @@master = []
    4.times do
      @@master << rand(1..6).to_s
    end
  end

  def self.check(guess)
    if @@guesses_remaining > 1
      @@temp = @@master.dup
      @correct = 0
      @position = 0
      for i in (0..3)
        if (guess[i] == @@temp[i])
          @correct += 1
          @@temp[i] = "x"
          guess[i] = "y"
        end
      end

      for j in (0..3)
        if guess.include?(@@temp[j])
          @position += 1
          ind = guess.index(@@temp[j])
          guess[ind] = "y"
        end
      end

      if @correct == 4
        winner
      else
        @@guesses_remaining -= 1
        puts "Correct: #{@correct}"
        puts "Out of position: #{@position}"
        puts "Guesses remaining: #{@@guesses_remaining}"
        return true
      end
    else
      puts "Oh no! You're out of guesses!"
      puts "GAME OVER"
      puts "The secret code was #{@@master}"
      play_again
    end
  end

  def self.winner
    puts "you've solved the code!"
    puts "you are the"
    puts "  __  __            _                     _           _
 |  \\/  | __ _  ___| |_  ___  _ _  _ __  (_) _ _   __| |
 | |\\/| |/ _` |(_-<|  _|/ -_)| '_|| '  \\ | || ' \\ / _` |
 |_|  |_|\\__,_|/__/ \\__|\\___||_|  |_|_|_||_||_||_|\\__,_|"
  end

  def self.play_again
    puts "Play again? Y/N"
    play = gets.chomp.upcase
    if play == "Y" || play == "YES"
      Mastermind.new
      exit
    else
      exit
    end
  end
end

class Player
  def initialize
    puts "What is your name?"
    @name = gets.chomp.upcase
  end
end

Mastermind.new

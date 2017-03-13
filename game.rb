class Game < Mastermind
  attr_accessor :correct, :position, :guesses_remaining, :prev_count, :possible_guesses
  def initialize
  end

  def self.check(guess, code)
    if @@player_name != "player"
      code = @@player_code
      puts " "
      puts guess.join
    end

    if @@player_name == "player"
      code = @@master_code
    end

    if @@guesses_remaining > 1
      @@temp = code.dup
      @correct = 0
      @position = 0
      for i in (0..3)
        if (guess[i] == @@temp[i])
          @correct += 1
          @@temp[i] = "x"
        end
      end

      for j in (0..3)
        if guess.include?(@@temp[j])
          @position += 1
        end
      end

      @@prev_count = [@correct, @position]
      if @correct == 4
        winner
      else
        @@guesses_remaining -= 1
        feedback
        return @@prev_count
        return true
      end
    else
      if @@player_name == "player"
        puts "Oh no! You're out of guesses!"
      else
        puts "The computer failed to guess your code!"
      end
      puts "  _______      ___      .___  ___.  _______      ______   ____    ____  _______ .______
 /  _____|    /   \\     |   \\/   | |   ____|    /  __  \\  \\   \\  /   / |   ____||   _  \\
|  |  __     /  ^  \\    |  \\  /  | |  |__      |  |  |  |  \\   \\/   /  |  |__   |  |_)  |
|  | |_ |   /  /_\\  \\   |  |\\/|  | |   __|     |  |  |  |   \\      /   |   __|  |      /
|  |__| |  /  _____  \\  |  |  |  | |  |____    |  `--'  |    \\    /    |  |____ |  |\\  \\----.
 \\______| /__/     \\__\\ |__|  |__| |_______|    \\______/      \\__/     |_______|| _| `._____|
                                                                                             "
      puts "The secret code was #{code}"
      play_again
    end
  end

  def guess_check(guess, code)
    @@temp = code.dup
    @correct = 0
    @position = 0
    for i in (0..3)
      if (guess[i] == @@temp[i])
        @correct += 1
        @@temp[i] = "x"
        #guess[i] = "y"
      end
    end

    for j in (0..3)
      if guess.include?(@@temp[j])
        @position += 1
      end
    end
    @current_count = [@correct, @position]
    return @current_count
  end

  def self.feedback
    puts "Correct: #{@correct}"
    puts "Out of position: #{@position}"
    puts "Guesses remaining: #{@@guesses_remaining}"
  end

  def self.winner
    if @@player_name == "player"
      puts "You've solved the code with #{@@guesses_remaining} guesses remaining!"
      puts "You are the MASTERMIND"
    else
      puts "The computer guessed your secret code with only #{13-@@guesses_remaining} guesses!"
    end
    play_again
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

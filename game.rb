class Game < Mastermind
  attr_accessor :correct, :position, :guesses_remaining

  def initialize
    @@master_code = []
    4.times do
      @@master_code << rand(1..6).to_s
    end
  end

  def self.check(guess)
    if @@player_name != "player"
      puts " "
      puts guess.join
    end

    if @@guesses_remaining > 1
      @@temp = @@master_code.dup
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
        feedback
        return true
      end
    else
      if @@player_name == "player"
        puts "Oh no! You're out of guesses!"
      else
        puts "The computer failed to guess your code!"
      end
      puts "GAME OVER"
      puts "The secret code was #{@@master_code}"
      play_again
    end
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

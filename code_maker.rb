class Mastermind
  def play_maker
    @@player_name = "computer"
    if @@guesses_remaining == 12
      puts "Enter your secret code. Choose 4 digits from 1 to 6."
      @@player_code = gets.chomp
      while (@@player_code.length != 4) || !(@@player_code =~ /[1-6]{4}/)
        puts "Code must be 4 digits from 1-6"
        @@player_code = gets.chomp
      end
      @@player_code = @@player_code.split("")
      computer_guess_two
    else
      computer_guess_two
    end
    if Game.check(@guess, @@player_code)
      play_maker
    end
  end

  def computer_guess
    if @@guesses_remaining == 12
      @guess = first_guess
    else
      @guess = @numbers.sample(4)
    end
  end

  def computer_guess_two
    if @@guesses_remaining == 12
      @guess = first_guess
    else
      filter_guesses
      @guess = @possible_guesses.sample
    end
    return @guess
  end

  def first_guess
    @guess = ["1", "1", "2", "2"]
  end

  def filter_guesses
    @possible_guesses.reject! do |code|
      guess_check(@guess, code)
      @current_count != @@prev_count
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
end

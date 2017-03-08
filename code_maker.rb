class Mastermind
  def play_maker
    if @@guesses_remaining == 12
    @@player_name = "computer"
    puts "Enter your secret code. Choose 4 digits from 1 to 6."
    @@master_code = gets.chomp
    while (@@master_code.length != 4) || !(@@master_code =~ /[1-6]{4}/)
      puts "Code must be 4 digits from 1-6"
      @@master_code = gets.chomp
    end
    @@master_code = @@master_code.split("")
    end


    if Game.check(computer_guess)
      play_maker
    end
    #if Game.check(@guess)
    #  play_maker
    #  puts "the computer guessed #{@guess}"
    #end

  end

  def computer_guess
    if @@guesses_remaining == 12
      @guess = first_guess

    else
      @guess = ["1", "2", "3", "4", "5", "6"].sample(4)
    end
  end

  def first_guess
    @guess = ["1", "1", "2", "2"]
  end
end

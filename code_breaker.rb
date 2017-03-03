class Mastermind
  def play_breaker
    puts "You get 12 attempts to break the secret code"
    puts "and prove yourself to be a MASTERMIND."
    puts "After each guess, you will see how many digits"
    puts "are in the correct position"
    puts "or are correct, but out of position."
    puts "Enter your guess. Choose 4 digits from 1 to 6."
    @guess = gets.chomp
    while (@guess.length != 4) || !(@guess =~ /[1-6]{4}/)
      puts "Guess must be 4 digits from 1-6"
      @guess = gets.chomp
    end
    @guess = @guess.split("")
    if Game.check(@guess)
      play_breaker
    end
  end

end

class Mastermind
  def play_breaker
    @@player_name = "player"
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

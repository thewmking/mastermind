class Mastermind
  def play_maker
    puts "Enter your secret code. Choose 4 digits from 1 to 6."
    @code = gets.chomp
    while (@code.length != 4) || !(@code =~ /[1-6]{4}/)
      puts "Code must be 4 digits from 1-6"
      @code = gets.chomp
    end
    @code = @code.split("")

  end

end

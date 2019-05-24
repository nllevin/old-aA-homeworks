class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length, @game_over, @seq = 1, false, []
  end

  def play
    self.take_turn until @game_over
    self.reset_game
    self.game_over_message
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    unless @game_over
      self.round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color
    
    system("clear")
    puts "Watch the sequence carefully:"
    sleep(1)
    system("clear")

    @seq.each do |color|
      sleep(0.1)
      print color
      sleep(0.8)
      system("clear")
    end
  end

  def require_sequence
    @seq.each do |color|
      puts "Enter the colors in the sequence in order:"
      
      user_input = gets.chomp.downcase
      until COLORS.include?(user_input)
        puts "Sorry, not a valid color choice. Try again:"
        user_input = gets.chomp.downcase
      end
      system("clear")

      unless color == user_input
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Great job, you passed that round!"
    sleep(0.8)
  end

  def game_over_message
    puts "Uh oh, you messed up. Game over!"

    user_input = nil
    until ["y", "n"].include?(user_input)  
      puts "Play again? (y/n)"
      user_input = gets.chomp.downcase
    end

    if user_input == "y"
      self.play
    else
      exit
    end
  end

  def reset_game
    @sequence_length, @game_over, @seq = 1, false, []
  end
end

require_relative 'rooms'

module Utility
  def Utility.you_died(lives)
    if lives < 1
      puts "You have died for reallll. GAME OVER!!!"
      
      puts "Do you want to start over?"
      start_over = gets.chomp
      if start_over == "yes"
        Game.new().play()
      elsif start_over == "no"
        puts "okay bye"
      Process.exit(0)
      end
    else
    puts "\n\n\tHey, you died man... bad move.\n"
    lives = lives - 1
    puts "\tYou have %s lives left!\n\n" % lives
    puts "Do you want to play again?"
    play_again = gets.chomp
      if play_again == "yes"
        return lives
      elsif play_again == "no"
        puts "Thanks for playing!"
        Process.exit(0)
      end
    end
  end
  
  def Utility.start_over?
    puts "Do you want to play again?"
    answer = gets.chomp
    if answer == "yes"
      Game.new().play()
    elsif answer == "no"
    else
      Utility.what?()
    end
  end
      
  def Utility.what?
    puts "I don't understand your answer man!"
  end
  
  def Utility.prompt
    print "> "
  end
  
end

# below is the class that starts the game

class Game
  
 def initialize(start)
   @start = start
 end
 
 def play
   Runner.new(@start)
 end
 
end

class Runner
  def initialize(start)
    @start = start
    @lives = 7
    self.run(start)    
  end
  
  def run(start)
    start = @start
    next_room = start
    while true
      room = method(next_room)
      next_room = room.call()
    end
  end
  
  def cell_challenge
    @cell = Cell.new().cell_challenge(@lives)
  end
  
  def enter_corridor
    @corridor = Corridor.new().enter_corridor(@lives)
  end
  
  def enter_booking_room
    @booking = Booking.new().enter_booking_room(@lives)
  end
  
end

class lives
  def initialize
    @lives = 7
  end
end


game = Game.new(:cell_challenge)

game.play()

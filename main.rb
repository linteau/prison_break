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

class Game
  
 def initialize()
   
 end
 
 def play
   lives = 7
   Cell.new.cell_challenge(lives)
 end
 
end


game = Game.new()

game.play()

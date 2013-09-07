require_relative 'rooms'

module Utility
  def Utility.you_died(lives)
    if lives < 1
      puts "You have died for reallll. GAME OVER!!!"
      Process.exit(0)
    else
    puts "Hey, you died man... bad move."
    lives = lives - 1
    puts "You have %s lives left!" % lives
    return lives
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

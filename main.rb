require_relative 'rooms'

module Utility
  
  def Utility.you_died()
    puts "Hey, you died man... bad move."
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
   @cell = Cell.new()
 end
 
 def play
   @cell.cell_challenge
 end
end


game = Game.new()

game.play()

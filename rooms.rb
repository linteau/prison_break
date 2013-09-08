
class Cell
  def cell_challenge(lives)
    puts <<-eos
    You wake up in a cell for a crime you didn't do. You are
    a law abiding citizen who was at the wrong place at the 
    wrong time. You are in the worst prison in Mexico city and
    don't know if you will make it out a live. Will you decide to
    escape or take your chances in the Jail?
  eos
  
  Utility.prompt(); your_move = gets.chomp
  
    if your_move.include? "escape" 
      self.cell_part_two(lives)
    elsif your_move.include? "chances"
      puts <<-eos
      You are one who is opposed to risk because you don't want any
      harml. Unfortunatley, you risk free tendancies have do not
      pay off. Your cell mate tries to take your food, and you refuse.
      So he stabs you to death with at plastic spork.
      eos
      lives = Lives.new().you_died(lives)
      self.cell_challenge(lives)
    else
      Utility.what?()
      self.cell_challenge(lives)
    end
  end
  
  def cell_part_two(lives)
    puts <<-eos
    You find your moment of opportunity to escape when a fat guard
    is bending down to pick something up. His keys and his gun are 
    within your reach, but you can't make a sound while approaching him.
    What is your next move?
    eos
    Utility.prompt(); your_move = gets.chomp
    if your_move.include? "take" && "keys" && "gun"
      puts "you took the keys and gun"
     return :enter_corridor # Corridor.new().enter_corridor(lives)
    else
      Utility.what?()
      self.cell_part_two(lives)
    end
  end
end

class Corridor
  
  def enter_corridor(lives)
    puts <<-eos
    You slowly walked up to the guard, then quickly grab his gun from his
    holster, and demand he give you the keys. You take the keys, put him in your
    cell, and knock him unconcious.
    
    You then open the gate from your cell block with the keys and enter a long narrow
    corridor. The corridor has windows about waste high and if you are seen you 
    will be shot on the spot. There is a ladder that leads to the attic over the corridor, 
    that you can take, or you can run for it, or you can crawl through the hallway.
    eos
  Utility.prompt(); your_move = gets.chomp
  puts your_move
  
  if your_move.include? "ladder" && "attic"
    puts <<-eos
    You climb up the ladder, open the hatch, and start to enter the attic. Unfortunately,
    you enter a room full of Correctional Officers. You shoot 3 of them, but you get shot
    from behind by a midget CO.
    eos
    lives = Lives.new().you_died(lives)
    self.enter_corridor(lives)
  elsif your_move.include? "run"
    puts <<-eos
    You start running as fast as you can through the corridor, luckily there is only one person
    that sees you and it is another inmate. He threatens to tell, so you open the door and allow
    him to go with you. You get to the end of the corridor, open the door, and enter the room where
    where they book people.
    eos
    return :enter_booking_room # Booking.new().enter_booking_room(lives)
  elsif your_move.include? "crawl"
    puts <<-eos
    You start crawling through the corridor, and almost get to the end, but since
    it takes you so long, you are spotted by a guard. Before you know it,
    the guard shoots and kills you while you are crawling.
    eos
    lives = Utility.you_died(lives)
    self.enter_corridor(lives)
  else
    Utility.what?()
    self.enter_corridor(lives)
  end
    
  end
end

class Booking
  def initialize
    @clothes = false
  end
  def enter_booking_room(lives)
    puts <<-eos
    You have entered the booking room, where they process inmates as they come in
    and as they go out. You have access to regular clothes, do you take them?
    eos
    Utility.prompt(); your_move = gets.chomp
    if your_move.include? "yes"
      @clothes = true
      self.empty_gutter(@clothes,lives)
    elsif your_move.include? "no"
      @clothes = false
      self.empty_gutter(@clothes, lives)
    else
      Utility.what?()
      self.enter_booking_room(lives)
    end
  end
  
  def empty_gutter(clothes,lives)
    @clothes = clothes
    puts <<-eos
    Looking around the room, you see a gutter through a grate on the floor, a ladder
    that takes you to the roof, and another door that goes to an unknown room. What
    is your next move?
    eos
    your_move = gets.chomp
    
    if your_move.include? "gutter"
      if @clothes == true
        puts <<-eos
        You change into your new clothes, lift the grate and jummp into the gutter.
        Luckily, the gutter is empty, and you are able to pass through it easily.
        You get to the end of the gutter and see a grate above you and climb out.
        Since you have normal clothes you blend in with the crowd.
        
        You got out!!!
        
        Do you want to play again?
        eos
        
        play_again = gets.chomp
        
        if play_again == "yes"
          "Restarting Game........"
          Game.new(:cell_challenge).play()
        elsif play_again == "no"
          puts "Okay, Thanks for playing!"
          Process.exit(0)
        end
      elsif @clothes == false
        puts <<-eos
        You lift the grate and jummp into the gutter. Luckily, the gutter is empty, and 
        you are able to pass through it easily. You get to the end of the gutter and see 
        a grate above you. You climb out, and a cop sees your wearing prison clothes and
        shoots you on the spot.
        eos
        lives = Lives.new().you_died(lives)
        self.enter_booking_room(lives)
      end
    elsif your_move.include? "ladder"
      puts <<-eos
      You climb up the ladder and are on top of the roof. A guard from a watchtower sees
      you and shoots you on the spot.
      eos
      lives = Utility.you_died(lives)
      self.empty_gutter(@clothes, lives)
    elsif your_move.include? "door"
      puts <<-eos
      You open the door, only to find a group of armed guards staring at you. You try to run,
      but are shot in the back 5 times.
      eos
      lives = Utility.you_died(lives)
      self.empty_gutter(@clothes, lives)
    else
      Utility.what?()
      self.empty_gutter(@clothes,lives)
    end
  end
end

class Cell
  
  def cell_challenge
    puts <<-eos
    You wake up in a cell for a crime you didn't do. You are
    a law abiding citizen who was at the wrong place at the 
    wrong time. You are in the worst prison in Mexico city and
    don't know if you will make it out a live. Will you decide to
    escape or take your chances in the Jail?
  eos
  
  Utility.prompt(); your_move = gets.chomp
  
    if your_move.include? "escape" 
      self.cell_part_two()
    elsif your_move.include? "chances"
      Utility.you_died()
    else
      Utility.what?()
      self.cell_challenge()
    end
  end
  
  def cell_part_two()
    puts <<-eos
    You find your moment of opportunity to escape when a fat guard
    is bending down to pick something up. His keys and his gun are 
    within your reach, but you can't make a sound while approaching him.
    What is your next move?
eos
    Utility.prompt(); your_move = gets.chomp
    if your_move.include? "take" && "keys" && "gun"
      puts "you took the keys and gun"
     Corridor.new().enter_corridor()
    else
      Utility.what?()
      self.cell_part_two()
    end
  end
end

class Corridor
  
  def enter_corridor
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
    Utility.you_died()
  elsif your_move.include? "run"
    puts <<-eos
    You start running as fast as you can through the corridor, luckily there is only one person
    that sees you and it is another inmate. He threatens to tell, so you open the door and allow
    him to go with you. You get to the end of the corridor, open the door, and enter the room where
    where they book people.
    eos
    Booking.new().enter_booking_room()
  elsif your_move.include? "crawl"
    puts <<-eos
    You start crawling through the corridor, and almost get to the end, but since
    it takes you so long, you are spotted by a guard. Before you know it,
    the guard shoots and kills you while you are crawling.
    eos
    Utility.you_died()
  else
    Utility.what?()
    self.enter_corridor()
  end
    
  end
end

class Booking
  def initialize
    @clothes = false
  end
  def enter_booking_room
    puts <<-eos
    You have entered the booking room, where they process inmates as they come in
    and as they go out. You have access to regular clothes, do you take them?
    eos
    Utility.prompt(); your_move = gets.chomp
    if your_move.include? "yes"
      @clothes = true
      self.empty_gutter(@clothes)
    elsif your_move.include? "no"
      @clothes = false
      self.empty_gutter(@clothes)
    else
      Utility.what?()
      self.enter_booking_room()
    end
  end
  
  def empty_gutter(clothes)
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
        eos
      elsif @clothes == false
        puts <<-eos
        You lift the grate and jummp into the gutter. Luckily, the gutter is empty, and 
        you are able to pass through it easily. You get to the end of the gutter and see 
        a grate above you. You climb out, and a cop sees your wearing prison clothes and
        shoots you on the spot.
        eos
        Utility.you_died()
      end
    elsif your_move.include? "ladder"
      puts <<-eos
      You climb up the ladder and are on top of the roof. A guard from a watchtower sees
      you and shoots you on the spot.
      eos
      Utility.you_died()
    elsif your_move.include? "door"
      puts <<-eos
      You open the door, only to find a group of armed guards staring at you. You try to run,
      but are shot in the back 5 times.
      eos
      Utility.you_died()
    else
      Utility.what?()
      self.empty_gutter(@clothes)
    end
  end
end
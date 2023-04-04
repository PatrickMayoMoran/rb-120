class Player
  
  def cheer(other)
    other.yell
  end

  protected

  def yell
    puts "Go!"
  end
end

class OLine < Player
end

class DLine < OLine
  protected
  
  def yell
    puts "Go D!"
  end
end

class Reserve < DLine
end

class WaterBoy < DLine
  protected

  def yell
    puts "Go!"
  end
end

player = Player.new
o = OLine.new
d = DLine.new
reserve = Reserve.new
water = WaterBoy.new

player.cheer(water)
o.cheer(player)
player.cheer(o)
# player.cheer(d)
# player.cheer(reserve)
# Above don't work - they have their own protected yell

reserve.cheer(d)
reserve.cheer(o)
reserve.cheer(player)
reserve.cheer(reserve)
# Interesting! They all work because the original call comes from bottom 
# of the inheritance hierarchy

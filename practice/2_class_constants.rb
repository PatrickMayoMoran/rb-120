PAJAMAS = "Catch a tiger by its toe"

class GreatGrandparent
  def ready_for_bed
    PAJAMAS
  end

  def ready_now
    PAJAMAS
  end
end

class Grandparent < GreatGrandparent
  PAJAMAS = "Bazonkers!"
end

class Parent < Grandparent
  def ready_for_bed
    PAJAMAS
  end
end

class Child < Parent
  PAJAMAS = "Alakazaam"
end

class Grandchild < Child
  def ready_for_bed
    PAJAMAS
  end
end

puts Grandchild.new.ready_for_bed
puts Parent.new.ready_for_bed
puts GreatGrandparent.new.ready_for_bed

puts Grandchild.new.ready_now
puts Parent.new.ready_now
puts GreatGrandparent.new.ready_now

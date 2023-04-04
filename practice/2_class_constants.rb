PAJAMAS = "Catch a tiger by its toe"

class GreatGrandparent
end

class Grandparent < GreatGrandparent
  PAJAMAS = "Bazonkers!"
end

class Parent < Grandparent
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

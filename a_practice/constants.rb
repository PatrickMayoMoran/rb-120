BasicObject::LOCATION = "Nowhere!"

class Activity
  #LOCATION = "Anywhere!"
end

class Sport < Activity
  #LOCATION = "Outdoors"

  def self.location
    self::LOCATION
  end
end

class Baseball < Sport ; end
class Basketball < Sport 
  LOCATION = "Indoors"
end
class Soccer < Sport; end

p Baseball.location
p Basketball.location
p Soccer.location

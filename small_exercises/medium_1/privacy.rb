class Machine

  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  def status
    switch
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

robot = Machine.new
robot.start
p robot.status # should be on
robot.stop
p robot.status # should be off
robot.flip_switch #should throw error

class Airport

  attr_reader :capacity # hardoded capacity
  attr_reader :planes  # list of planes in airport

  def initialize(capacity_total)
    @capacity = capacity_total
    @planes = [] # create empty array for all our planes
  end

  def weather
    weather = 'sunny'
  end

  def capacity_usage
    capacity_usage = 'empty'
  end

  def change_cap(new_cap)
    @capacity = new_cap
  end

  def add_plane(plane)
    @planes.push(plane) # push plane object into array
  end

end

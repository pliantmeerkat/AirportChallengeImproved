class Airport

  attr_accessor :capacity # total capacity
  attr_reader :planes  # list of planes in airport
  attr_reader :planecount
  attr_accessor :people
  attr_accessor :weather

  def initialize(capacity_total)
    @capacity = capacity_total
    @planes = [] # create empty array for all our planes
    @planecount = 0 # is always zero at first
    @people = 0
    @weather = 'sunny'
  end

  def add_plane(plane)
    @planes.push(plane) # push plane object into array
    @planecount += 1 # add one to our plane count
  end

  def reset_planes # reset the planes in the airport, for testing
    @planecount = 0
    @planes = []
  end

end

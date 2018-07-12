class Airport

  attr_reader :capacity # hardoded capacity
  attr_reader :planes  # list of planes in airport
  attr_reader :planecount
  attr_reader :people
  attr_reader :weather

  def initialize(capacity_total)
    @capacity = capacity_total
    @planes = [] # create empty array for all our planes
    @planecount = 0 # is always zero at first
    @people = 0
    @weather = 'sunny'
  end

  def weather_change(condition) # change weather method
      @weather = condition
  end

  def capacity_usage(change=0) # change airport capacity
    @people += change # add passengers, returns people if no change
  end

  def change_cap(new_cap) # change airport capacity
    @capacity = new_cap
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

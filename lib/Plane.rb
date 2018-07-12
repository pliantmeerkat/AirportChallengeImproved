
class Plane

  attr_reader :airport
  attr_reader :passengers

  def initialize(passengers=0) # 0 is default passengers
    @passengers = passengers
  end

  def land(airport)
    @airport = airport # assign airport as instance var
    airport.add_plane(self) # add plane to airport
    airport.capacity_usage(passengers) # add passengers to airport capacity
    return (airport.weather != 'stormy' && airport.people < airport.capacity ?
            true : false) # pervent landing in adverse conditions
  end

  def take_off(airport)
    @airport = nil # no airport now
    airport.planes.delete(self) # delete self from array
    return airport.weather != 'stormy' ? true : false
  end

end


class Plane

  attr_reader :airport

  def land(airport)
    @airport = airport
  end

  def take_off(airport)
    @airport = nil # no airport now
    airport.planes.delete(self) # delete self from array
  end

end

require  './lib/Plane'

describe 'Plane' do # plane feature usit tests

  airport = Airport.new(50000) # create an airport object
  plane = Plane.new # create new plane object
  ## testing with good conditions
  it 'Plane can land' do
    expect(airport.weather).to_not eq('stormy')
    expect(airport.people).to_not eq(airport.capacity)
    expect(plane.land(airport)).to eq(true)
  end

  it 'Plane can take off' do
    expect(airport.weather).to_not eq('stormy')
    expect(airport.people).to_not eq(airport.capacity)
  end

  # testing with bad conditions
  it 'does not land if bad waeather' do
    airport.weather = 'stormy'
    expect(plane.land(airport)).to eq(false)
  end

  it 'does not land if airport is full' do
    airport.weather = 'sunny' # set weather to sunny as its been tested
    airport.people = airport.capacity
    expect(plane.land(airport)).to eq(false)
  end

  it 'does not take off if bad weather' do
    airport.weather = 'stormy'
    expect(plane.take_off(airport)).to eq(false)
  end

  it 'Plane has taken off' do
    if airport.planes.count(plane) == 0 # check if our plane is in the array
      airport.add_plane(plane) # add if not
    end
    plane.take_off(airport) # take off our plane
    expect(plane.airport).to eq(nil) # plane should not be in an airport
    expect(airport.planes.count(plane)).to eq(0) # plane should not be in array
  end

  it 'plane has passengers' do # passegners cannot be added after init
    expect(plane.passengers).to_not eq(nil) # passengers are not nil
  end

end

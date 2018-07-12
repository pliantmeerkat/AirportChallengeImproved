require  './lib/Plane'

describe 'Plane' do # plane feature usit tests

  airport = Airport.new(50000) # create an airport object
  plane = Plane.new # create new plane object
  it 'Plane can land' do
    expect(airport.weather).to_not eq('stormy')
    expect(airport.capacity_usage).to_not eq('full')
  end

  it 'Plane can take off' do
    expect(airport.weather).to_not eq('stormy')
    expect(airport.capacity_usage).to_not eq('full')
  end

  it 'Plane has taken off' do
    if airport.planes.count(plane) == 0 # check if our plane is in the array
      airport.add_plane(plane) # add if not
    end
    plane.take_off(airport) # take off our plane
    expect(plane.airport).to eq(nil) # plane should not be in an airport
    expect(airport.planes.count(plane)).to eq(0) # plane should not be in array
  end







end

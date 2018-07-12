require './lib/Airport' # airport lib
require './lib/Plane' # plane lib

describe 'Airpot' do

  airport = Airport.new(50000) # 50000 is default capacity
  plane = Plane.new

  it 'default capacity is 50000' do
    expect(airport.capacity).to eq(50000)
  end

  it 'can change total capacity' do
    10.times do |i| # multiple runs so different numbers are used
      new_cap = 1 + rand(100000) # random number to check for different values
      airport.change_cap(new_cap)
      expect(airport.capacity).to eq(new_cap)
    end
  end

  it 'has the correct amount of planes' do
    expect(airport.planecount).to be >= 0 # check if count is below zero
    expect(airport.planecount).to eq(airport.planes.length) # count mathces array
  end

  it 'can track a plane that has landed' do
    plane.land(airport) # land a plane in the airport
    expect(airport.planes[-1]).to eq(plane) # is our plane at the end of array
  end

  it 'can reset planes' do #test the reset method
    airport.reset_planes
    expect(airport.planes).to eq([])
    expect(airport.planecount).to eq(0)
  end

  it 'has and can check total passengers' do
    expect(airport.people).to_not eq(nil) # has at least 0 people
  end

  it 'can change weather' do
    expect(airport).to respond_to(:weather_change)
  end

  it 'has a change in passengers when a plane lands' do
    Plane.new(150).land(airport) # land a new plane with 150 passengers
    expect(airport.people).to eq(150) # should be 150
  end

  ## multpile landings/ take off tests
  it 'can land multpiple planes and track them in numerical order' do
    airport.capacity_usage(-150) # set capacity usage to 0 for next test
    plane1 = Plane.new(100); plane2 = Plane.new(100); plane3 = Plane.new(100)
    plane4 = Plane.new(100); plane5 = Plane.new(100) # create 5 planes
    airport.reset_planes # reset airport before test
    testplanes = [plane1, plane2, plane3, plane4, plane5] # array of test planes
    testplanes.each { |p| p.land(airport) } # land our planes in order
    expect(airport.planes).to eq(testplanes) # arrays should match
    expect(airport.people).to eq(500)
  end

  it 'can land multiple planes and track them in a random order' do
    airport.capacity_usage(-500) # set capacity usage to 0 for next test
    10.times do # run the test 10 times
      airport.capacity_usage(-airport.people) # reset capacity
      peeps = (10..200).to_a.sample(5) # generate random numbers of people
      plane1 = Plane.new(peeps[0]); plane2 = Plane.new(peeps[1])
      plane3 = Plane.new(peeps[2]); plane4 = Plane.new(peeps[3])
      plane5 = Plane.new(peeps[4]) # create 5 planes with randomised peeps
      airport.reset_planes # reset number of planes
      testplanes = { 1 => plane1, 2 => plane2, 3 => plane3, 4 => plane4,
                    5 => plane5 } # create a hash of planes
      testplanea = [] # array for comparison
      order = (1..5).to_a.sample(5) # make a random number array
      order.each { |i| testplanes[i].land(airport)
                       testplanea.push(testplanes[i]) } # land the land
      expect(airport.planes).to eq(testplanea) # compare the arrays
      expect(airport.people).to eq(peeps.inject(0, :+))
    end
  end

end

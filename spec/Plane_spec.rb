require  './lib/Plane'

describe 'Plane' do # plane feature usit tests

  it 'Plane can land' do

    expect(Airport.new.weather).to_not eq('stormy')
    expect(Airport.new.capacity).to_not eq('full')

  end

  it 'Plane can take off' do

    expect(Airport.new.weather).to_not eq('stormy')
    expect(Airport.new.capacity).to_not eq('full')

  end

  it 'Plane has taken off' do

    expect(Plane.new.take_off).to eq(nil)

  end



end

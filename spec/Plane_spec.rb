require  './lib/Plane'

describe 'Plane' do # plane feature usit tests

  it 'Plane can land' do

    expect(Plane.new.land).to be true

  end

end

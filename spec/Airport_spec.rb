require './lib/Airport'

describe 'Airpot' do

  it 'default capacity is 50000' do

    expect(Airport.new.defcapacity).to eq(50000)

  end

end

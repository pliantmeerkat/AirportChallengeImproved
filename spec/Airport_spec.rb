require './lib/Airport'

describe 'Airpot' do
  airport = Airport.new(50000) # 50000 is default capacity

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

end

require './lib/vehicle.rb'
require './lib/passenger.rb'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Vehicle do
  before(:each) do
    @vehicle = Vehicle.new("2001", "Honda", "Civic")
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @jude = Passenger.new({"name" => "Jude", "age" => 20})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  it 'initialize' do
    expect(@vehicle).to be_a(Vehicle)
  end

  it 'check attributes' do
    expect(@vehicle.year).to eq("2001")
    expect(@vehicle.make).to eq("Honda")
    expect(@vehicle.model).to eq("Civic") # if it wasnt time limited i could just split these up, no errors though so no issue as it is.
  end

  it 'can check if speeding' do
    expect(@vehicle.speeding?).to be false
    @vehicle.speed
    expect(@vehicle.speeding?).to be true
  end

  it 'can add passengers' do
    expect(@vehicle.passengers).to eq([])
    @vehicle.add_passenger(@charlie)
    @vehicle.add_passenger(@jude)
    @vehicle.add_passenger(@taylor)
    expect(@vehicle.passengers).to eq([@charlie, @jude, @taylor])
  end

  it 'can count number of adults' do
    @vehicle.add_passenger(@charlie)
    @vehicle.add_passenger(@jude)
    @vehicle.add_passenger(@taylor)
    expect(@vehicle.num_adults).to eq(2) # 2 adults as taylor is 12
  end
end
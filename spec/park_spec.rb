require './lib/park'
require './lib/vehicle'
require './lib/passenger'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Park do
  before(:each) do
    @park = Park.new("Great Sand Dunes", 30)
    @vehicle1 = Vehicle.new("2001", "Honda", "Civic")
    @vehicle2 = Vehicle.new("2015", "Toyota", "Camry")
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @jude = Passenger.new({"name" => "Jude", "age" => 20})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  it 'initialize' do
    expect(@park).to be_a(Park)
  end

  it 'has correct attributes' do
    expect(@park.name).to eq("Great Sand Dunes")
    expect(@park.admission_price).to eq(30)
  end

  it 'list all vehicles' do
    expect(@park.vehicles).to eq([])
    @park.add_vehicle(@vehicle1)
    @park.add_vehicle(@vehicle2)
    expect(@park.vehicles).to eq([@vehicle1, @vehicle2])
  end

  it 'list all passengers' do
    @vehicle1.add_passenger(@charlie)
    @vehicle1.add_passenger(@taylor)
    @vehicle2.add_passenger(@jude)
    @park.add_vehicle(@vehicle1)
    @park.add_vehicle(@vehicle2)
    expect(@park.all_passengers).to eq([@charlie, @taylor, @jude])
  end

  it 'calculate total revenue' do
    @vehicle1.add_passenger(@charlie)
    @vehicle1.add_passenger(@taylor)
    @vehicle2.add_passenger(@jude)
    @park.add_vehicle(@vehicle1)
    @park.add_vehicle(@vehicle2)
    expect(@park.revenue).to eq(60) # 2 * 30 (adults * price)
  end
end
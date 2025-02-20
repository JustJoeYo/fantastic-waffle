require './lib/passenger.rb'

# This block helps format the test results
RSpec.configure do |config|
  config.formatter = :documentation
end

# Your tests should start here!
RSpec.describe Passenger do
  before(:each) do
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  it 'initialize' do
    expect(@charlie).to be_a(Passenger)
    expect(@taylor).to be_a(Passenger)
  end

  it 'has name' do
    expect(@charlie.name).to eq("Charlie")
    expect(@taylor.name).to eq("Taylor")
  end

  it 'has age' do
    expect(@charlie.age).to eq(18)
    expect(@taylor.age).to eq(12)
  end

  it 'check if passenger is an adult' do
    expect(@charlie.adult?).to be true
    expect(@taylor.adult?).to be false
  end

  it 'checks if passenger can drive' do
    expect(@charlie.driver?).to be false
    @charlie.drive
    expect(@charlie.driver?).to be true
  end
end
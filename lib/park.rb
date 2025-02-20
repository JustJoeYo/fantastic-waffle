class Park
  attr_reader :name, :admission_price, :vehicles

  def initialize(name, admission_price)
    @name = name
    @admission_price = admission_price
    @vehicles = []
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle
  end

  def all_passengers
    @vehicles.flat_map(&:passengers)
  end

  def revenue
    all_passengers.count { |passenger| passenger.adult? } * @admission_price
  end

  # iteration 4 below 
  
  def passenger_names
    all_passengers.map(&:name).sort # sorts names alphabetically
  end

  def minors
    all_passengers.select { |passenger| !passenger.adult? }.map(&:name).sort # children are mapped and adds names to an array to be sorted alphabetically
  end

  def adults
    all_passengers.select { |passenger| passenger.adult? }.map(&:name).sort # adults are mapped and adds names to an array to be sorted alphabetically (possibly copy and pasted above comment lol)
  end
end
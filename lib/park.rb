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
end
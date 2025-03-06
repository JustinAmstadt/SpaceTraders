class Fuel
  def initialize(fuel_json)
    @current = fuel_json["current"]
    @capacity = fuel_json["capacity"]
    @consumed_amount = fuel_json["consumed"]["amount"]
    @consumed_timestamp = fuel_json["consumed"]["timestamp"]
  end

  def to_s
    <<~STRING
      Fuel Information:
      Current: #{@current} units
      Capacity: #{@capacity} units
      Consumed: #{@consumed_amount} units
      Last Consumed: #{@consumed_timestamp}
    STRING
  end
end

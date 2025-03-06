require './ships/location'

class Route
  def initialize(route_json)
    @origin = Location.new(route_json["origin"])
    @destination = Location.new(route_json["destination"])
    @arrival_time = route_json["arrival"]
    @departure_time = route_json["departureTime"]
  end

  def to_s
    <<~STRING
      Route Information:
      Origin: #{@origin.to_s}
      Destination: #{@destination.to_s}
      Arrival Time: #{@arrival_time}
      Departure Time: #{@departure_time}
    STRING
  end
end
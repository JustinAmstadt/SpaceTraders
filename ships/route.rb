require './location'

class Route
  def initialize(route_json)
    @origin = Location.new(route_json["origin"])
    @destination = Location.new(route_json["destination"])
    @arrival_time = route_json["arrival"]
    @departure_time = route_json["departureTime"]
  end

end
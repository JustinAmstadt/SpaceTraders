require './route'

class Nav
  def initialize(nav_json)
    @system_symbol = nav_json["systemSymbol"]
    @waypoint_symbol = nav_json["waypointSymbol"]
    @route = Route.new(nav_json["route"])
    @status = nav_json["status"]
    @flight_mode = nav_json["flightMode"]
  end
end
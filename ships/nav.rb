require './ships/route'

class Nav
  def initialize(nav_json)
    @system_symbol = nav_json["systemSymbol"]
    @waypoint_symbol = nav_json["waypointSymbol"]
    @route = Route.new(nav_json["route"])
    @status = nav_json["status"]
    @flight_mode = nav_json["flightMode"]
  end

  def to_s
    <<~STRING
      Navigation Information:
      System Symbol: #{@system_symbol}
      Waypoint Symbol: #{@waypoint_symbol}
      Route: #{@route.to_s}
      Status: #{@status}
      Flight Mode: #{@flight_mode}
    STRING
  end
end
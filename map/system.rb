require './endpoints'
require './map/point'

class System
  attr_reader :symbol, :sector_symbol, :type, :point, :waypoints

  def initialize(token, system_json)
    @symbol = system_json["symbol"]
    @sector_symbol = system_json["sectorSymbol"]
    @type = system_json["type"]
    @point = Point.new(system_json["x"], system_json["y"])
    # @waypoints = make_waypoints(token, @symbol)
  end

  private def make_waypoints(token, system_symbol)
    waypoint_json_list = get_system_waypoints(token, system_symbol)

    waypoint_json_list.each_with_object({}) do |waypoint_json, hash|
      waypoint_symbol = waypoint_json["symbol"]
      puts "Making waypoint: #{waypoint_symbol}"
      hash[waypoint_symbol] = Waypoint.new(token, waypoint_symbol, waypoint_json)
    end
  end

  private def get_system_waypoints(token, system_symbol)
    SystemsEndpoint.system_waypoints(token, system_symbol)
  end

  def to_s
    waypoints_info = @waypoints.map { |symbol, waypoint| "#{symbol}: #{waypoint.to_s}" }.join("\n")
    "System Symbol: #{@symbol}\n" +
    "Sector: #{@sector_symbol}\n" +
    "Type: #{@type}\n" +
    "Point: (#{@point.x}, #{@point.y})\n" +
    "Waypoints:\n#{waypoints_info}"
  end
end
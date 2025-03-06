class Location
  def initialize(location_json)
    @symbol = location_json["symbol"]
    @type = location_json["type"]
    @system_symbol = location_json["systemSymbol"]
    @x = location_json["x"]
    @y = location_json["y"]
  end

  def to_s
    "Location Symbol: #{@symbol}, Type: #{@type}, System: #{@system_symbol}, Coordinates: (#{@x}, #{@y})"
  end
end
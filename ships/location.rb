class Location
  def initialize(location_json)
    @symbol = location_json["symbol"]
    @type = location_json["type"]
    @system_symbol = location_json["systemSymbol"]
    @x = location_json["x"]
    @y = location_json["y"]
  end
end
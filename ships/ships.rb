require 'json'

require './endpoints'
require './nav'
require './crew'

class AgentShips
  def initialize(token)
    data = MyShipsEndpoint.call_endpoint(token)
    puts JSON.pretty_generate(data)
    
    @ships = data.map { |ship_json| Ship.new(data[0]) }
  end
end

class Ship
  def initialize(ship_json)
    @symbol = ship_json["symbol"]
    @nav = Nav.new(ship_json["nav"])
    @crew = Crew.new(ship_json["crew"])
  end
end
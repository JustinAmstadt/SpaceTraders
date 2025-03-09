class Endpoint
  def self.make_header(token)
    { 'Authorization' => "Bearer #{token}" }
  end
end
class AgentEndpoint < Endpoint
  ENDPOINT = 'my/agent'

  def self.call_endpoint(token)
    agent_endpoint = "#{SPACE_TRADERS_URL}/#{ENDPOINT}"
    response = HTTParty.get(agent_endpoint, headers: make_header(token))
    response["data"]
  end
end

class WaypointEndpoint < Endpoint
  def self.call_endpoint(token, system_symbol, waypoint_symbol)
    waypoint_endpoint = "#{SPACE_TRADERS_URL}/systems/#{system_symbol}/waypoints/#{waypoint_symbol}"
    response = HTTParty.get(waypoint_endpoint, headers: make_header(token))
    response["data"]
  end

  def self.search_waypoint(token, system_symbol, type)
    search_endpoint = "#{SPACE_TRADERS_URL}/systems/#{system_symbol}/waypoints?type#{type}"
    response = HTTParty.get(search_endpoint, headers: make_header(token))
    response["data"]
  end
end

class MyContractsEndpoint < Endpoint
  def self.get_my_contracts(token)
    my_contracts_endpoint = "#{SPACE_TRADERS_URL}/my/contracts"
    response = HTTParty.get(my_contracts_endpoint, headers: make_header(token))
    response["data"]
  end

  def self.accept_contract(token, contract_id)
    accept_contract_endpoint = "#{SPACE_TRADERS_URL}/my/contracts/#{contract_id}/accept"
    response = HTTParty.post(accept_contract_endpoint, headers: make_header(token))
    response["data"]
  end
end

class MyShipsEndpoint < Endpoint
  @my_ships_endpoint = "#{SPACE_TRADERS_URL}/my/ships"

  def self.get_my_ships(token)
    response = HTTParty.get(@my_ships_endpoint, headers: make_header(token))
    response["data"]
  end

  def self.negotiate_new_contract(token, ship_symbol)
    negotiate_contract_endpoint = "#{@my_ships_endpoint}/#{ship_symbol}/negotiate/contract"
    response = HTTParty.get(negotiate_contract_endpoint, headers: make_header(token))
    response["data"]
  end

  def self.dock(token, ship_symbol)
    dock_endpoint = "#{@my_ships_endpoint}/#{ship_symbol}/dock"
    response = HTTParty.post(dock_endpoint, headers: make_header(token))
    response["data"]
  end

  def self.orbit(token, ship_symbol)
    orbit_endpoint = "#{@my_ships_endpoint}/#{ship_symbol}/orbit"
    response = HTTParty.post(orbit_endpoint, headers: make_header(token))
    response["data"]
  end
end
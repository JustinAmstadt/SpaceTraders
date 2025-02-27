class AgentEndpoint
  ENDPOINT = 'my/agent'

  def self.call_endpoint(token)
    agent_endpoint = "#{SPACE_TRADERS_URL}/#{ENDPOINT}"
    response = HTTParty.get(agent_endpoint, headers: { 'Authorization' => "Bearer #{token}" })
    response["data"]
  end
end

class WaypointEndpoint
  def self.call_endpoint(token, system_symbol, waypoint_symbol)
    waypoint_endpoint = "#{SPACE_TRADERS_URL}/systems/#{system_symbol}/waypoints/#{waypoint_symbol}"
    response = HTTParty.get(waypoint_endpoint, headers: { 'Authorization' => "Bearer #{token}" })
    response["data"]
  end
end

class MyContractsEndpoint
  def self.call_endpoint(token)
    my_contracts_endpoint = "#{SPACE_TRADERS_URL}/my/contracts"
    response = HTTParty.get(my_contracts_endpoint, headers: { 'Authorization' => "Bearer #{token}" })
    response["data"]
  end
end

class NewContractEndpoint
  def self.call_endpoint(token)
    my_contracts_endpoint = "#{SPACE_TRADERS_URL}/my/contracts"
    response = HTTParty.get(my_contracts_endpoint, headers: { 'Authorization' => "Bearer #{token}" })
    response["data"]
  end
end

class MyShipsEndpoint
  def self.call_endpoint(token)
    my_ships_endpoint = "#{SPACE_TRADERS_URL}/my/ships"
    response = HTTParty.get(my_ships_endpoint, headers: { 'Authorization' => "Bearer #{token}" })
    response["data"]
  end
end
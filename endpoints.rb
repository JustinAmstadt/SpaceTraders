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
end

class MyContractsEndpoint < Endpoint
  def self.get_my_contracts(token)
    my_contracts_endpoint = "#{SPACE_TRADERS_URL}/my/contracts"
    response = HTTParty.get(my_contracts_endpoint, headers: make_header(token))
    response["data"]
  end

  def self.accept_contract(token, contractId)
    accept_contract_endpoint = "#{SPACE_TRADERS_URL}/my/contracts/#{contractId}/accept"
    response = HTTParty.get(accept_contract_endpoint, headers: make_header(token))
    response["data"]
  end
end

class MyShipsEndpoint < Endpoint
  @my_ships_endpoint = "#{SPACE_TRADERS_URL}/my/ships"

  def self.get_my_ships(token)
    response = HTTParty.get(@my_ships_endpoint, headers: make_header(token))
    response["data"]
  end

  def self.negotiate_new_contract(token, shipSymbol)
    negotiate_contract_path = "#{@my_ships_endpoint}/#{shipSymbol}/negotiate/contract"
    response = HTTParty.get(negotiate_contract_path, headers: make_header(token))
    response["data"]
  end
end
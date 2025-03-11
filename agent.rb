require 'httparty'
require 'dotenv'
require 'json'

require './config'
require './endpoints'
require './contracts/contracts'
require './map/waypoint'
require './ships/ships'

class Agent
  attr_reader :ships, :contracts, :headquarters

  def initialize(token)
    data = AgentEndpoint.call_endpoint(token)

    raise ArgumentError, "agent data is nil" if data.nil?
    
    @token = token
    @account_id = data["accountId"]
    @symbol = data["symbol"]
    @headquarters = get_headquarters_waypoint(data["headquarters"])
    @credits = data["credits"]
    @starting_faction = data["startingFactions"]
    @ship_count = data["shipCount"]
    @ships = get_agent_ships
    @contracts = get_current_contracts
  end

  private def get_headquarters_waypoint(headquarters)
    Waypoint.new(@token, headquarters)
  end

  private def get_agent_ships
    AgentShips.new(@token)
  end

  def display_headquarters
    puts @headquarters.to_s
  end

  def display_ship_details
    puts @ships.to_s
  end

  def list_ships
    puts @ships.list_ship_names
  end

  private def get_current_contracts
    AgentContracts.new(@token)
  end

  def list_contracts
    puts @contracts.to_s
  end

  def get_new_contract
  end
end

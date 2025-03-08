require 'httparty'
require 'dotenv'
require 'json'

require './config'
require './endpoints'
require './contracts'
require './waypoint'
require './ships/ships'

class Agent
  attr_reader :ships 

  def initialize(token)
    data = AgentEndpoint.call_endpoint(token)
    @token = token
    @account_id = data["accountId"]
    @symbol = data["symbol"]
    @headquarters = get_headquarters_waypoint(data["headquarters"])
    @credits = data["credits"]
    @starting_faction = data["startingFactions"]
    @ship_count = data["shipCount"]
    @ships = get_agent_ships
    @contracts = ""
  end

  private def get_headquarters_waypoint(headquarters)
    Waypoint.new(@token, headquarters)
  end

  private def get_agent_ships
    AgentShips.new(@token)
  end

  def display_headquarters
    @headquarters.display_info
  end

  def display_ship_details
    puts @ships.to_s
  end

  def list_ships
    puts @ships.list_ship_names
  end

  def get_current_contracts
    AgentContracts.new(@token)
  end

  def get_new_contract
  end
end

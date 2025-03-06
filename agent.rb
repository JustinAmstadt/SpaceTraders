require 'httparty'
require 'dotenv'
require 'json'

require './config'
require './endpoints'
require './contracts'
require './waypoint'
require './ships/ships'

class Agent
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
    puts @ships.to_s
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

  def get_current_contracts
    AgentContracts.new(@token)
  end
end

agent = Agent.new(AGENT_TOKEN)
# agent.display_headquarters

agent.get_current_contracts
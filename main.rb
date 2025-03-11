require './agent'
require './map/universe'
require 'json'
require './logger'
require './endpoints'

universe = Universe.new(AGENT_TOKEN)
agent = Agent.new(AGENT_TOKEN)

ships = agent.ships
contracts = agent.contracts

loop do
  print "Enter a command (or type 'exit' to quit): "
  input = gets.chomp  # Read user input and remove the newline
  input = input.downcase

  case
  when input == "myships"
    agent.list_ships
  when input.match?(/^ship\s+(\S+)$/)
    ship_symbol = input.split.last.upcase
    ship = ships.get_ship(ship_symbol)
    puts ship.to_s
  when input.match?(/^ship\s+dock\s+(\S+)$/) 
    ship_symbol = input.split.last.upcase
    ship = ships.get_ship(ship_symbol)
    puts ship.dock(AGENT_TOKEN)
  when input.match?(/^ship\s+orbit\s+(\S+)$/) 
    ship_symbol = input.split.last.upcase
    ship = ships.get_ship(ship_symbol)
    puts ship.orbit(AGENT_TOKEN)
  when input.match?(/^ship\s+navigate\s+(\S+)\s+(\S+)$/)
    match = input.match(/^ship\s+navigate\s+(\S+)\s+(\S+)$/)
    ship_symbol = match[1].upcase
    waypoint_symbol = match[2].upcase
    ship = ships.get_ship(ship_symbol)
    data = ship.navigate_to(AGENT_TOKEN, waypoint_symbol)
    puts data

  when input == "engineered asteroid"

  when input == "headquarters"
    agent.display_headquarters

  when input == "mycontracts"
    agent.list_contracts
  when input.match?(/^contract\s+(\S+)$/)
    id = input.split.last
    contract = contracts.get_contract(id)
    puts contract.to_s
  when input.match?(/^contract\s+accept\s+(\S+)$/) 
    id = input.split.last
    contract = contracts.get_contract(id)
    new_contract = contract.accept(AGENT_TOKEN, id)
    contracts.set_contract(id, new_contract)

  when input == "newcontract"

  when input == "log universe"
    Logger.to_log("universe.log", universe.to_s)

  when input == "plot universe"
    universe.plot_universe

  when input == "engineered asteroid"
    data = WaypointEndpoint.search_waypoint(AGENT_TOKEN, "X1-TZ54", "ENGINEERED_ASTEROID")
    puts data

  end
    
  break if input == 'exit'
end

puts "Goodbye!"

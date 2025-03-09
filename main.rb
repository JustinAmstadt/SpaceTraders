require "./agent"

agent = Agent.new(AGENT_TOKEN)
# agent.display_headquarters

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

  end
    
  break if input == 'exit'
end

puts "Goodbye!"

require "./agent"

agent = Agent.new(AGENT_TOKEN)
# agent.display_headquarters

ships = agent.ships

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
  when input == "mycontracts"
    agent.get_current_contracts
  when input == "newcontract"

  end
    
  break if input == 'exit'
end

puts "Goodbye!"

require 'json'

require './endpoints'
require './contracts/terms'

class AgentContracts
  def initialize(token)
    data = MyContractsEndpoint.get_my_contracts(token)
    @contracts = data.map { |contract_json|
      puts "Creating contract #{contract_json["id"]}"
      [contract_json["id"], Contract.new(contract_json)]
  }.to_h
  end

  def new_contract(token, shipSymbol)
    data = MyShipsEndpoint.negotiate_new_contract(token, shipSymbol)
    puts data
  end

  def to_s
    @contracts.values.map(&:to_s).join(",\n")
  end

  def get_contract(id)
    @contracts[id]
  end

  def set_contract(id, contract)
    @contracts[id] = contract
  end
end

class Contract
  attr_reader :id, :faction_symbol, :type, :terms, :accepted, :fulfilled, :expiration, :deadline_to_accept

  def initialize(contract_json)
    @id = contract_json["id"]
    @faction_symbol = contract_json["factionSymbol"]
    @type = contract_json["type"]
    @terms = Terms.new(contract_json["terms"])
    @accepted = contract_json["accepted"]
    @fulfilled = contract_json["fulfilled"]
    @expiration = contract_json["expiration"]
    @deadline_to_accept = contract_json["deadlineToAccept"]
  end

  def accept(token, contract_id)
    contract_json = MyContractsEndpoint.accept_contract(token, contract_id)
    Contract.new(contract_json)
  end

  def to_s
    <<~CONTRACT
      Contract ID: #{@id}
      Faction: #{@faction_symbol}
      Type: #{@type}
      Accepted: #{@accepted}
      Fulfilled: #{@fulfilled}
      Expiration: #{@expiration}
      Deadline to Accept: #{@deadline_to_accept}
      Terms:
      #{@terms}
    CONTRACT
  end
end


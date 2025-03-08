require './endpoints'

class AgentContracts
  def initialize(token)
    @contracts = MyContractsEndpoint.get_my_contracts(token)
    puts data
  end

  def new_contract(token, shipSymbol)
    data = MyShipsEndpoint.negotiate_new_contract(token, shipSymbol)
    puts data
  end
end
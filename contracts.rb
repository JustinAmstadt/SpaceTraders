require './endpoints'

class AgentContracts
  def initialize(token)
    data = MyContractsEndpoint.get_my_contracts(token)
    puts data
  end
end
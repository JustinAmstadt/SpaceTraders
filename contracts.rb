require './endpoints'

class AgentContracts
  def initialize(token)
    data = MyContractsEndpoint.call_endpoint(token)
    puts data
  end
end
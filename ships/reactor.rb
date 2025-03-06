require "./ships/requirements"

class Reactor
  def initialize(reactor_json)
    @symbol = reactor_json["symbol"]
    @name = reactor_json["name"]
    @description = reactor_json["description"]
    @condition = reactor_json["condition"]
    @integrity = reactor_json["integrity"]
    @power_output = reactor_json["powerOutput"]
    @requirements = Requirements.new(reactor_json["requirements"])
  end

  def to_s
    <<~STRING
      Reactor: #{@name} (#{@symbol})
      Description: #{@description}
      Condition: #{@condition}, Integrity: #{@integrity}
      Power Output: #{@power_output}
      Requirements: #{@requirements}
    STRING
  end
end

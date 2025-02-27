class Reactor
  def initialize(reactor_json)
    @symbol = reactor_json["symbol"]
    @name = reactor_json["name"]
    @description = reactor_json["description"]
    @condition = reactor_json["condition"]
    @integrity = reactor_json["integrity"]
    @power_output = reactor_json["powerOutput"]
    @requirements = reactor_json["requirements"]
  end
end

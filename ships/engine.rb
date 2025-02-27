class Engine
  def initialize(engine_json)
    @symbol = engine_json["symbol"]
    @name = engine_json["name"]
    @description = engine_json["description"]
    @condition = engine_json["condition"]
    @integrity = engine_json["integrity"]
    @speed = engine_json["speed"]
    @requirements = engine_json["requirements"]
  end
end

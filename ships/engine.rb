require "./ships/requirements"

class Engine
  def initialize(engine_json)
    @symbol = engine_json["symbol"]
    @name = engine_json["name"]
    @description = engine_json["description"]
    @condition = engine_json["condition"]
    @integrity = engine_json["integrity"]
    @speed = engine_json["speed"]
    @requirements = Requirements.new(engine_json["requirements"])
  end

  def to_s
    <<~STRING
      Engine: #{@name} (#{@symbol})
      Description: #{@description}
      Condition: #{@condition}, Integrity: #{@integrity}
      Speed: #{@speed}
      Requirements: #{@requirements}
    STRING
  end
end

require "./ships/requirements"

class Module
  def initialize(module_json)
    @symbol = module_json["symbol"]
    @name = module_json["name"]
    @description = module_json["description"]
    @capacity = module_json["capacity"]
    @requirements = Requirements.new(module_json["requirements"])
  end

  def to_s
    "Module: #{@name} (#{@symbol}), Capacity: #{@capacity}, Requirements: #{@requirements}"
  end
end

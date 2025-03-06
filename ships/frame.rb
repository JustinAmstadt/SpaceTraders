require "./ships/requirements"

class Frame
  def initialize(frame_json)
    @symbol = frame_json["symbol"]
    @name = frame_json["name"]
    @description = frame_json["description"]
    @module_slots = frame_json["moduleSlots"]
    @mounting_points = frame_json["mountingPoints"]
    @fuel_capacity = frame_json["fuelCapacity"]
    @condition = frame_json["condition"]
    @integrity = frame_json["integrity"]
    @requirements = Requirements.new(frame_json["requirements"])
  end

  def to_s
    <<~STRING
      Frame: #{@name} (#{@symbol})
      Description: #{@description}
      Module Slots: #{@module_slots}, Mounting Points: #{@mounting_points}
      Fuel Capacity: #{@fuel_capacity}, Condition: #{@condition}, Integrity: #{@integrity}
      Requirements: #{@requirements}
    STRING
  end
end

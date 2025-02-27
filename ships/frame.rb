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
    @requirements = frame_json["requirements"]
  end
end

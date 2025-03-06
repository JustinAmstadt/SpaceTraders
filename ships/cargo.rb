class Cargo
  def initialize(cargo_json)
    @capacity = cargo_json["capacity"]
    @units = cargo_json["units"]
    @inventory = cargo_json["inventory"] # This could be an array of item objects
  end

  def to_s
    inventory_list = @inventory.empty? ? "No items" : @inventory.join(", ")
    <<~STRING
      Cargo Information:
      Capacity: #{@capacity}
      Units: #{@units}
      Inventory: #{inventory_list}
    STRING
  end
end

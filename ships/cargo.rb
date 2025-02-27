class Cargo
  def initialize(cargo_json)
    @capacity = cargo_json["capacity"]
    @units = cargo_json["units"]
    @inventory = cargo_json["inventory"] # This could be an array of item objects
  end
end

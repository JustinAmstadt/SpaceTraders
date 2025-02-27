class Registration
  def initialize(registration_json)
    @name = registration_json["name"]
    @faction_symbol = registration_json["factionSymbol"]
    @role = registration_json["role"]
  end
end

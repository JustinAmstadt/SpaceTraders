class Registration
  def initialize(registration_json)
    @name = registration_json["name"]
    @faction_symbol = registration_json["factionSymbol"]
    @role = registration_json["role"]
  end

  def to_s
    <<~STRING
      Registration Information:
      Name: #{@name}
      Faction Symbol: #{@faction_symbol}
      Role: #{@role}
    STRING
  end
end

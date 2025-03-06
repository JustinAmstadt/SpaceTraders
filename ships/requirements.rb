class Requirements
  def initialize(requirements_json)
    @crew = requirements_json["crew"] || 0
    @power = requirements_json.fetch("power", nil) # Allows nil if not present
    @slots = requirements_json.fetch("slots", nil) # Allows nil if not present
  end

  def to_s
    "Crew: #{@crew}, Power: #{@power || 'N/A'}, Slots: #{@slots || 'N/A'}"
  end
end

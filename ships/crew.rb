class Crew
  def initialize(crew_json)
    @current_crew_size = crew_json["current"]
    @crew_size_capacity = crew_json["capacity"]
    @required_crew_size = crew_json["required"]
    @crew_rotation = crew_json["rotation"]
    @morale = crew_json["morale"]
    @wages = crew_json["wages"]
  end
end
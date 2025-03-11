require './map/point'

Trait = Struct.new(:symbol, :name, :description)
Chart = Struct.new(:submitted_by, :submitted_on)

class Waypoint
  def initialize(token, waypoint_symbol, data = {})
    @symbol = waypoint_symbol

    if data.empty?
      system = get_system
      data = WaypointEndpoint.call_endpoint(@token, system, waypoint_symbol)
    end

    @type = data["type"]
    @point = Point.new(data["x"], data["y"])
    @orbitals = make_orbits_array(data["orbitals"])
    @traits = make_traits(data["traits"])
    @modifiers = data["modifiers"]
    @chart = Chart.new(data["submittedBy"], data["submittedOn"])
    @faction = data["faction"]
    @is_under_construction = data["isUnderConstruction"]
  end

  private def get_system
    tokens = split_symbol
    tokens[0] + "-" + tokens[1]
  end

  private def split_symbol
    @symbol.split("-")
  end


  private def make_orbits_array(orbitals)
    orbitals.map { |orbital| orbital["symbol"] }
  end

  private def make_traits(traits)
    traits.map do |trait_data|
      Trait.new(trait_data["symbol"], trait_data["name"], trait_data["description"])
    end
  end

  def to_s
    str = <<~INFO
      Symbol: #{@symbol}
      Type: #{@type}
      Point: (#{@point.x}, #{@point.y})
      Orbitals: #{@orbitals.join(", ")}
      Traits:
    INFO
  
    @traits.each do |trait|
      str << "  - #{trait.name} (#{trait.symbol}): #{trait.description}\n"
    end
  
    str << if @chart.submitted_by
             "Chart: Submitted by #{@chart.submitted_by} on #{@chart.submitted_on}\n"
           else
             "Chart: Not submitted\n"
           end
  
    str << "Modifiers: #{@modifiers}\n"
    str << "Faction: #{@faction}\n"
    str << "Is Under Construction: #{@is_under_construction}\n"
  
    str
  end

end
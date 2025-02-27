Point = Struct.new(:x, :y)
Trait = Struct.new(:symbol, :name, :description)
Chart = Struct.new(:submitted_by, :submitted_on)

class Waypoint
  def initialize(token, waypoint_symbol)
    @symbol = waypoint_symbol
    system = get_system
    data = WaypointEndpoint.call_endpoint(@token, system, waypoint_symbol)
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

  def display_info
    puts "Symbol: #{@symbol}"
    puts "Type: #{@type}"
    puts "Point: (#{@point.x}, #{@point.y})"
    puts "Orbitals: #{@orbitals}"
    puts "Traits: #{@traits}"
    puts "Chart: #{@chart}"
    puts "Faction: #{@faction}"
    puts "Is Under Construction: #{@is_under_construction}"
  end
end
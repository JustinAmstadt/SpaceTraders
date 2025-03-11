require './map/system'
require './plot/plot'

class Universe
  attr_reader :systems
  @systems = {}

  def initialize(token)
    @systems = make_systems(token)
  end

  private def make_systems(token)
    system_json_list = get_systems(token)

    system_json_list.each_with_object({}) do |system_json, hash|
      system_symbol = system_json["symbol"]
      puts "Making system: #{system_symbol}"
      hash[system_symbol] = System.new(token, system_json)
    end
  end

  private def get_systems(token)
    SystemsEndpoint.systems(token)
  end

  def to_s
    universe_info = "Universe contains the following systems:\n"
    
    @systems.each do |symbol, system|
      universe_info += "#{system.to_s}\n\n"
    end
    
    universe_info
  end

  def plot_universe()
    coordinates = get_system_coordinates
    
    puts "X Coordinates: #{coordinates[:x]}"
    puts "Y Coordinates: #{coordinates[:y]}"
    if coordinates[:x].empty? || coordinates[:y].empty?
      raise 'X or Y coordinates are empty. Please check the data.'
    end

    Plot.plot("Universe-Plot", coordinates)
  end

  private def get_system_coordinates
    coordinates = {}

    x_coordinates = []
    y_coordinates = []
    @systems.each do |symbol, system|
      x_coordinates.push(system.point.x)
      y_coordinates.push(system.point.y)
    end

    coordinates[:x] = x_coordinates
    coordinates[:y] = y_coordinates

    puts coordinates

    coordinates
  end
end
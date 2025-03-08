require 'json'

require './endpoints'
require './ships/nav'
require './ships/crew'
require './ships/fuel'
require './ships/cooldown'
require './ships/frame'
require './ships/reactor'
require './ships/engine'
require './ships/module'
require './ships/mount'
require './ships/registration'
require './ships/cargo'

class AgentShips
  def initialize(token)
    data = MyShipsEndpoint.get_my_ships(token)
    @ships = data.map do |ship_json| 
      puts "Creating ship #{ship_json["symbol"]}"
      Ship.new(ship_json)
    end

    def to_s
      str = ""
      for ship in @ships
        str << "{\n#{ship.to_s}},\n"
      end
      str
    end
  end
end

class Ship
  attr_reader :symbol, :nav, :crew, :fuel, :cooldown, :frame, :reactor, :engine, 
              :modules, :mounts, :registration, :cargo

  def initialize(ship_json)
    @symbol = ship_json["symbol"]
    @nav = Nav.new(ship_json["nav"])
    @crew = Crew.new(ship_json["crew"])
    @fuel = Fuel.new(ship_json["fuel"])
    @cooldown = Cooldown.new(ship_json["cooldown"])
    @frame = Frame.new(ship_json["frame"])
    @reactor = Reactor.new(ship_json["reactor"])
    @engine = Engine.new(ship_json["engine"])
    
    @modules = ship_json["modules"].map { |mod| Module.new(mod) }
    @mounts = ship_json["mounts"].map { |mount| Mount.new(mount) }
    
    @registration = Registration.new(ship_json["registration"])
    @cargo = Cargo.new(ship_json["cargo"])
  end

  def orbit
  end

  def dock
  end

  def set_flight_mode()
  end

  def navigate_to()
  end

  def warp_to()
  end

  def jump_to()
  end

  def refuel()
    # must be docked
  end

  def extract()
  end

  def get_cargo_currently_held
  end

  def view_market_data
  end

  def sell_cargo
  end

  def get_repair_cost
  end

  def repair
  end

  def scrap
  end

  def to_s
    <<~SHIP_INFO
      Ship: #{@symbol}
      Navigation: #{@nav}
      Crew: #{@crew}
      Fuel: #{@fuel}
      Cooldown: #{@cooldown}
      Frame: #{@frame}
      Reactor: #{@reactor}
      Engine: #{@engine}
      Modules:
        #{modules.map(&:to_s).join("\n      ")}
      Mounts:
        #{mounts.map(&:to_s).join("\n      ")}
      Registration: #{@registration}
      Cargo: #{@cargo}
    SHIP_INFO
  end
end

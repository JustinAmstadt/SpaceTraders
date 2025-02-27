class Cooldown
  def initialize(cooldown_json)
    @ship_symbol = cooldown_json["shipSymbol"]
    @total_seconds = cooldown_json["totalSeconds"]
    @remaining_seconds = cooldown_json["remainingSeconds"]
  end
end

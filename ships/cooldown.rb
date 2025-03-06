class Cooldown
  def initialize(cooldown_json)
    @ship_symbol = cooldown_json["shipSymbol"]
    @total_seconds = cooldown_json["totalSeconds"]
    @remaining_seconds = cooldown_json["remainingSeconds"]
  end

  def to_s
    <<~STRING
      Cooldown for ship #{@ship_symbol}:
      Total Time: #{@total_seconds} seconds
      Remaining Time: #{@remaining_seconds} seconds
    STRING
  end
end

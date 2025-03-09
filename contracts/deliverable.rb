class Deliverable
  attr_reader :trade_symbol, :destination_symbol, :units_required, :units_fulfilled

  def initialize(deliverable_json)
    @trade_symbol = deliverable_json["tradeSymbol"]
    @destination_symbol = deliverable_json["destinationSymbol"]
    @units_required = deliverable_json["unitsRequired"]
    @units_fulfilled = deliverable_json["unitsFulfilled"]
  end

  def to_s
    "Deliver #{@units_required}x #{@trade_symbol} to #{@destination_symbol} (Fulfilled: #{@units_fulfilled})"
  end
end
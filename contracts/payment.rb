class Payment
  attr_reader :on_accepted, :on_fulfilled

  def initialize(payment_json)
    @on_accepted = payment_json["onAccepted"]
    @on_fulfilled = payment_json["onFulfilled"]
  end

  def to_s
    "On Accepted: #{@on_accepted}, On Fulfilled: #{@on_fulfilled}"
  end
end

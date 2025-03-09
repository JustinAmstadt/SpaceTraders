require './contracts/payment'
require './contracts/deliverable'

class Terms
  attr_reader :deadline, :payment, :deliverables

  def initialize(terms_json)
    @deadline = terms_json["deadline"]
    @payment = Payment.new(terms_json["payment"])
    @deliverables = terms_json["deliver"].map { |d| Deliverable.new(d) }
  end

  def to_s
    <<~TERMS
      Deadline: #{@deadline}
      Payment:
      #{@payment}
      Deliverables:
      #{@deliverables.map(&:to_s).join("\n")}
    TERMS
  end
end
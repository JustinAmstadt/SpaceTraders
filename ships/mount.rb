require "./ships/requirements"

class Mount
  def initialize(mount_json)
    @symbol = mount_json["symbol"]
    @name = mount_json["name"]
    @description = mount_json["description"]
    @strength = mount_json["strength"]
    @deposits = mount_json.fetch("deposits", []) # Defaults to an empty array if not present
    @requirements = Requirements.new(mount_json.fetch("requirements", {})) # Defaults to empty hash
  end

  def to_s
    deposit_info = @deposits.any? ? "Deposits: #{@deposits.join(', ')}" : "No Deposits"
    "Mount: #{@name} (#{@symbol}), Strength: #{@strength}, #{deposit_info}, Requirements: #{@requirements}"
  end
end

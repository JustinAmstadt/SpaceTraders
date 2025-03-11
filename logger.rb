class Logger
  def self.to_log(filename, str)
    File.open(filename, 'w') do |file|
      file.puts(str)
    end
  end
end
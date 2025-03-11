require 'gruff'

class Plot
  def self.plot(window_name, coordinates)
    g = Gruff::Scatter.new
    g.title = "Labeled Scatter Plot"
    g.theme = Gruff::Themes::THIRTYSEVEN_SIGNALS

    # Data points (x, y) coordinates
    x_values = coordinates[:x]
    y_values = coordinates[:y]
    labels = ["A", "B", "C", "D", "E"]

    # Add dataset
    g.data("Points", x_values, y_values)

    # Add labels manually
    # x_values.each_with_index do |x, index|
      # g.labels[index] = labels[index] # Assign labels
    # end

    # Save the graph to a file
    g.write("scatter_plot.png")

    puts "Scatter plot saved as scatter_plot.png"
  end
end
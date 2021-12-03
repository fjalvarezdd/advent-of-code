class Dive
  def read_input
    File.readlines('resources/input.txt')
  end

  def calculate_increases_with_sliding_window
    forward = 0
    depth = 0
    measurements = read_input
    measurements && !measurements.empty? && measurements.each do |instruction|
      direction = instruction.split(' ')[0]
      distance = instruction.split(' ')[1].to_i
      if direction == "forward"
        forward += distance
      else
        if direction == "up"
          depth -= distance
        else
          if direction == "down"
            depth += distance
          end
        end
      end
    end
    forward * depth
  end
end

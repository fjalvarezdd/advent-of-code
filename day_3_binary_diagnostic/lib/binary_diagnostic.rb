class BinaryDiagnostic
  def read_input
    File.readlines('resources/input.txt')
  end

  def calculate_most_used(instructions)
    columns = []
    counter = 0
    instructions && !instructions.empty? && instructions.each do |instruction|
      counter += 1
      instruction.to_s.delete("\r\n").split('').each_with_index do |bit, index|
        columns[index] = { 0 => 0, 1 => 0 } if counter == 1
        columns[index][bit.to_i] += 1
      end
    end
    columns
  end

  def calculate_position
    instructions = read_input
    gamma = ''
    epsilon = ''
    calculate_most_used(instructions).each do |column|
      gamma += column[0] > column[1] ? "0" : "1"
      epsilon += column[0] <= column[1] ? "0" : "1"
    end
    gamma.to_i(2) * epsilon.to_i(2)
  end
end
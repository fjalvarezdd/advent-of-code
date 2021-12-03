class SonarSweep
  def read_input
    File.readlines('resources/input.txt').map(&:to_i)
  end

  def calculate_increases
    result = 0
    deeps = read_input
    deeps && !deeps.empty? && deeps.each_with_index do |deep, index|
      next if index == 0
      result += 1 if deep > deeps[index - 1]
    end
    result
  end
end



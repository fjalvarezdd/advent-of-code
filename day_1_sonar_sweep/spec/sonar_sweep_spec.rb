require 'sonar_sweep'
RSpec.describe SonarSweep do
  context 'checking empty file' do
    before do
      allow_any_instance_of(SonarSweep)
        .to receive(:read_input)
              .and_return(false)
    end
    it 'return no results' do
      sonar_sweep = SonarSweep.new
      expect(sonar_sweep.calculate_increases).to eq 0
    end
  end
  context 'checking valid file' do
    before do
      allow_any_instance_of(SonarSweep)
        .to receive(:read_input)
              .and_return([1, 2, 3, 2])
    end
    it 'return valid result' do
      sonar_sweep = SonarSweep.new
      expect(sonar_sweep.calculate_increases).to eq 2
    end
  end
end
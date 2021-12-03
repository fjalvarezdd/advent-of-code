require 'dive'
RSpec.describe Dive do
  context 'checking empty file' do
    before do
      allow_any_instance_of(Dive)
        .to receive(:read_input)
              .and_return(false)
    end
    it 'return no results' do
      dive = Dive.new
      expect(dive.calculate_increases_with_sliding_window).to eq 0
    end
  end
  context 'checking with no forward' do
    before do
      allow_any_instance_of(Dive)
        .to receive(:read_input)
              .and_return(["down 5"])
    end
    it 'return empty result' do
      dive = Dive.new
      expect(dive.calculate_increases_with_sliding_window).to eq 0
    end
  end
  context 'checking with example values' do
    before do
      allow_any_instance_of(Dive)
        .to receive(:read_input)
              .and_return(["forward 5",
                           "down 5",
                           "forward 8",
                           "up 3",
                           "down 8",
                           "forward 2"])
    end
    it 'return 150' do
      dive = Dive.new
      expect(dive.calculate_increases_with_sliding_window).to eq 150
    end
  end
end
require 'spec_helper'

module FFSplitter
  describe Encoder do
    describe "#encode!" do
      let(:runner) { double("runner", :accept => true) }
      let(:chapter){ Chapter.new(start_frames: 10, end_frames: 20, timebase: 1, title: "test title") }
      let(:encoder){ Encoder.new("test.mp4", runner: runner) }
      it "encodes the chapters" do
        expect(runner).to receive(:run).with("ffmpeg -i test.mp4 -ss 10.0 -to 20.0 -c copy 'test title.mp4'")
        encoder.encode([chapter])
      end
    end
  end
end
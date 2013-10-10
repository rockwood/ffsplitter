require 'spec_helper'

module FFSplitter
  describe FFMpeg do
    let(:runner) { double("runner", :accept => true) }
    let(:ffmpeg){ FFMpeg.new("test.mp4") }
    before { ffmpeg.runner = runner }

    describe "#encode" do
      let(:chapter){ Chapter.new(start_frames: 10, end_frames: 20, timebase: 1, title: "test title") }
      it "encodes the chapters" do
        expect(runner).to receive(:run).with("ffmpeg -i test.mp4 -ss 10.0 -to 20.0 -c copy '#{chapter.filename}.mp4'")
        ffmpeg.encode([chapter])
      end
    end

    describe "#read_metadata" do
      let(:filename) { "test.mp4" }
      it "reads the metadata" do
        expect(runner).to receive(:run).with("ffmpeg -i #{filename} -v quiet -f ffmetadata -")
        ffmpeg.read_metadata
      end
    end
  end
end
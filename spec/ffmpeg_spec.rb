require 'spec_helper'

module FFSplitter
  describe FFMpeg do
    let(:ffmpeg){ FFMpeg.new("test.mp4") }
    let(:runner) { double("runner") }
    before { ffmpeg.runner = runner }

    describe "#encode" do
      let(:chapter_list) { ChapterList.new }
      let(:chapter) { Chapter.new(start_frames: 10, end_frames: 20, timebase: 1, title: "title") }
      before { chapter_list.add(chapter) }
      it "encodes the chapters" do
        expect(runner).to receive(:run).with "ffmpeg -i test.mp4 -ss 10.0 -to 20.0 -c copy '01 title.mp4'"
        ffmpeg.encode(chapter_list)
      end
    end

    describe "#read_metadata" do
      it "reads the metadata" do
        expect(runner).to receive(:run).with("ffmpeg -i test.mp4 -v quiet -f ffmetadata -")
        ffmpeg.read_metadata
      end
    end
  end
end
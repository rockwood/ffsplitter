require 'spec_helper'

module FFSplitter
  describe FFMpeg do
    let(:filename) { "test.mp4" }
    let(:output_directory) { nil }
    let(:ffmpeg){ FFMpeg.new(filename, output_directory) }
    let(:runner) { double("runner") }
    before { ffmpeg.runner = runner }

    describe "#encode" do
      let(:chapter_list) { ChapterList.new }
      let(:chapter) { Chapter.new(start_frames: 10, end_frames: 20, timebase: 1, title: "title") }
      before { chapter_list.add(chapter) }
      context "without an output directory" do
        it "encodes the chapters" do
          expect(runner).to receive(:run).with(/-i 'test.mp4' -ss 10.0 -to 20.0/)
          ffmpeg.encode(chapter_list)
        end
      end
      context "with an output directory" do
        let(:output_directory) { "spec/tmp/" }
        it "encodes the chapters with an output directory" do
          expect(runner).to receive(:run).with(/spec\/tmp\/01 title.mp4/)
          ffmpeg.encode(chapter_list)
        end
      end

      context "with multiple files" do
        before { chapter_list.add(Chapter.new(title: "Chapter 2")) }
        it "encodes the chapters with a single ffmpeg command" do
          expect(runner).to receive(:run).once()
          ffmpeg.encode(chapter_list)
        end
      end
    end

    describe "#read_metadata" do
      it "reads the metadata" do
        expect(runner).to receive(:run).with("ffmpeg -i 'test.mp4' -v quiet -f ffmetadata -")
        ffmpeg.read_metadata
      end
    end
  end
end
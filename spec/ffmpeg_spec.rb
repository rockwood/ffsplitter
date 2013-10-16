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
      let(:chapter1) { Chapter.new(title: "Chapter 1") }
      let(:chapter2) { Chapter.new(title: "Chapter 2") }

      context "with a single chapter" do
        before { chapter_list.add(chapter1) }
        it "encodes the chapter" do
          expect(runner).to receive(:run).with("ffmpeg #{ffmpeg.chapter_command(chapter1)}")
          ffmpeg.encode(chapter_list)
        end
      end

      context "with multiple chapters" do
        before do
          chapter_list.add(chapter1)
          chapter_list.add(chapter2)
        end
        it "encodes the chapters with a single ffmpeg command" do
          commands = "#{ffmpeg.chapter_command(chapter1)} #{ffmpeg.chapter_command(chapter2)}"
          expect(runner).to receive(:run).once.with("ffmpeg #{commands}")
          ffmpeg.encode(chapter_list)
        end
      end
    end

    describe "#chapter_command" do
      let(:command) { ffmpeg.chapter_command(chapter) }
      let(:chapter) { Chapter.new(start_frames: 10, end_frames: 20, timebase: 1, title: "test title") }

      context "without an output directory" do
        let(:output_directory) { nil }
        it "creates a chapter command" do
          expect(command).to match("-i 'test.mp4'")
          expect(command).to match("-ss 10.0")
          expect(command).to match("-to 20.0")
          expect(command).to match("-c copy")
          expect(command).to match("#{File.expand_path(chapter.filename)}")
        end
      end

      context "with an output directory" do
        let(:output_directory) { "test_dir" }
        it "creates returns the path to that directory" do
          expect(command).to match("#{File.expand_path(chapter.filename, "test_dir")}")
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
require 'spec_helper'

module FFSplitter
  describe Chapter do
    describe "#start_time, #end_time" do
      let(:chapter){ Chapter.new(start_frames: 100, end_frames: 200, timebase: 0.5) }
      it "calculates based on frames and timebase" do
        expect(chapter.start_time).to eq(50)
        expect(chapter.end_time).to eq(100)
      end
    end

    describe "filename" do
      let(:chapter){ Chapter.new(title: "   test title") }
      it "prettys up the chapter title" do
        expect(chapter.filename).to eq("test title")
      end
    end
  end
end
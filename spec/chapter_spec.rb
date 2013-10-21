require 'spec_helper'

module FFSplitter
  describe ChapterList do
    describe "#add" do
      let(:chapter_list) { ChapterList.new }
      let!(:chapter1) { Chapter.new(title: "Chapter One") }
      let!(:chapter2) { Chapter.new(title: "Chapter Two") }
      before do
        chapter_list.add(chapter1)
        chapter_list.add(chapter2)
      end
      it "adds chapters to its collection" do
        expect(chapter_list.count).to eq(2)
        expect(chapter_list).to include(chapter1)
        expect(chapter_list).to include(chapter2)
      end
      it "sets the chapter's list" do
        expect(chapter1.list).to eq(chapter_list)
      end
    end
  end

  describe Chapter do
    describe "#start_time, #end_time" do
      let(:chapter){ Chapter.new(start_frames: 100, end_frames: 200, timebase: 0.5) }
      it "calculates based on frames and timebase" do
        expect(chapter.start_time).to eq(50)
        expect(chapter.end_time).to eq(100)
      end
    end

    describe "#filename" do
      let(:filename) {""}
      let(:chapter){ Chapter.new(title: filename) }
      context "with leading spaces" do
        let(:filename) { "   test title" }
        it "removes them" do
          expect(chapter.filename).to eq("01 test title")
        end
      end
      context "with ';:\\" do
        let(:filename) { "what's wrong; with: \\this" }
        it "removes them" do
          expect(chapter.filename).to eq("01 whats wrong with this")
        end
      end
    end

    describe "#index" do
      let(:chapter) { Chapter.new }
      context "without a list" do
        it "returns 0" do
          expect(chapter.index).to eq(0)
        end
      end
      context "with a list" do
        let(:chapter_list) { ChapterList.new }
        before do
          chapter_list.add Chapter.new
          chapter_list.add chapter
        end
        it "returns the index" do
          expect(chapter.index).to eq(1)
        end
      end
    end
  end
end
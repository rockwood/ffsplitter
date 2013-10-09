require 'spec_helper'

module FFSplitter
  describe ChapterCollection do
    let(:chapter_collection) { ChapterCollection.new }
    let(:chapter1) { Chapter.new(title: "Chapter One") }
    let(:chapter2) { Chapter.new(title: "Chapter Two") }
    describe "#add" do
      context "with a chapter object" do
        before { chapter_collection.add(chapter1) }
        before { chapter_collection.add(chapter2) }
        it "adds it to its collection" do
          expect(chapter_collection.chapters.first).to eq(chapter1)
          expect(chapter_collection.chapters.last).to eq(chapter2)
        end
        it "sets the chapter's index" do
          expect(chapter1.index).to eq(0)
          expect(chapter2.index).to eq(1)
        end
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

    describe "filename" do
      let(:chapter){ Chapter.new(title: "   test title", index: 0) }
      it "prettys up the chapter title" do
        expect(chapter.filename).to eq("01 test title")
      end
    end
  end
end
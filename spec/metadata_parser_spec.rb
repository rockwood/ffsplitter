require 'spec_helper'
require 'fixtures/metadata_fixtures'

module FFSplitter
  describe MetadataParser do
    describe ".parse_chapters" do
      context "with a single chapter" do
        let(:metadata) do
          <<-EOF
            [CHAPTER]
            TIMEBASE=1/2
            START=100
            END=200
            title=Ludwig van Beethoven - Piano Trio in D Major
          EOF
        end
        let(:chapter_collection){ MetadataParser.parse_chapters(metadata) }
        let(:first_chapter){ chapter_collection.chapters.first }
        it "parses the chapters as an array" do
          expect(chapter_collection.chapters.length).to eq(1)
        end

        it "calculates the timebase" do
          expect(first_chapter.timebase).to eq(0.5)
        end

        it "multiplies the start time by the timebase" do
          expect(first_chapter.start_time).to eq(50)
        end

        it "multiplies the end frames by the timebase" do
          expect(first_chapter.end_time).to eq(100)
        end

        it "parses the title" do
          expect(first_chapter.title).to eq("Ludwig van Beethoven - Piano Trio in D Major")
        end
      end

      context "with multiple chapters" do
        let(:metadata) do
          <<-EOF
            [CHAPTER]
            title=Chapter One
            [CHAPTER]
            title=Chapter Two
          EOF
        end
        let(:chapter_collection){ MetadataParser.parse_chapters(metadata) }
        it "parses all the chapters" do
          expect(chapter_collection.chapters.length).to eq(2)
        end
        it "sets up the indexes" do
          expect(chapter_collection.chapters.first.index).to eq(0)
          expect(chapter_collection.chapters.last.index).to eq(1)
        end
      end
    end
  end
end
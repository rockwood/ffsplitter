require 'spec_helper'
require 'fixtures/metadata_fixtures'

module FFSplitter
  describe MetadataParser do
    describe ".parse_chapters" do
      let(:metadata) do
        <<-EOF
          [CHAPTER]
          START=100
          END=200
          title=Ludwig van Beethoven - Piano Trio in D Major
        EOF
      end
      let(:chapters){ MetadataParser.parse_chapters(metadata) }
      it "parses the chapters" do
        expect(chapters.length).to eq(1)
        expect(chapters.first.start).to eq(100)
        expect(chapters.first.end).to eq(200)
        expect(chapters.first.title).to eq("Ludwig van Beethoven - Piano Trio in D Major")
      end
    end
  end
end
require 'spec_helper'
require 'fixtures/metadata_fixtures'

module FFSplitter
  describe MetadataParser do
    let(:metadata_parser){ MetadataParser.new(MetadataFixtures::MULTICHAPTER) }
    it "parses the chapters" do
      expect(metadata_parser.parse.length).to eq(3)
    end
  end
end
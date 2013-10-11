require 'spec_helper'

module FFSplitter
  describe Splitter do
    describe ".split!" do
      let(:codec) { double('Codec') }
      let(:metadata) do
        <<-EOF
          [CHAPTER]
          title=Chapter One
        EOF
      end
      it "parses and encodes" do
        expect(codec).to receive(:read_metadata).and_return(metadata)
        expect(codec).to receive(:encode).with(an_instance_of(ChapterList))
        Splitter.split(codec)
      end
    end
  end
end
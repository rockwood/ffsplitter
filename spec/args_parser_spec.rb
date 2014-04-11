require 'spec_helper'

describe ArgsParser do
  let(:options) { ArgsParser.parse!(args) }

  context "with an input file" do
    let(:args) { ["test.mp4"] }
    specify do
      expect(options.filename).to eq("test.mp4")
    end
  end

  describe "output_extension" do
    let(:args) { ["-e", ".mp3"] }
    specify do
      expect(options.output_extension).to eq(".mp3")
    end
  end

  describe "output_file" do
    let(:args) { ["-o", "test/"] }
    specify do
      expect(options.output_path).to eq(File.expand_path("test/"))
    end
  end
end

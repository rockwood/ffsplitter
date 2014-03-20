require 'spec_helper'

describe ArgsParser do
  let(:options) { ArgsParser.parse!(args) }

  context "with an input file" do
    let(:args) { ["test.mp4"] }
    specify do
      expect(options.filename).to eq("test.mp4")
    end
  end

  describe "audio extension" do
    context "undefined" do
      let(:args) { [] }
      specify do
        expect(options.audio_extension).to eq(".wav")
      end
    end
    context "defined" do
      let(:args) { ["-a", ".mp3"] }
      specify do
        expect(options.audio_extension).to eq(".mp3")
      end
    end
  end

  describe "video_extension" do
    context "undefined" do
      let(:args) { [] }
      specify do
        expect(options.video_extension).to eq(".mp4")
      end
    end
    context "defined" do
      let(:args) { ["-v", ".mov"] }
      specify do
        expect(options.video_extension).to eq(".mov")
      end
    end
  end

  describe "output_file" do
    context "undefined" do
      let(:args) { [] }
      specify do
        expect(options.output_path).to eq(nil)
      end
    end
    context "defined" do
      let(:args) { ["-o", "test/"] }
      specify do
        expect(options.output_path).to eq(File.expand_path("test/"))
      end
    end
  end
end

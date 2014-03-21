require 'spec_helper'

module FFSplitter
  describe "End to end" do
    before { Dir.mkdir("tmp") unless Dir.exist?("tmp") }

    describe "split" do
      context "with audio and video" do
        before { `bundle exec ruby -Ilib bin/ffsplitter 'spec/fixtures/test video.mp4' -o tmp 2>&1` }
        let(:file_list) { Dir.glob("tmp/*")  }
        it "creates files" do
          expect(file_list).to include("tmp/01 Chapter 1.mp4")
          expect(file_list).to include("tmp/02 - Chapter 2.mp4")
          expect(file_list).to include("tmp/03 Chapter 3.mp4")
        end
      end

      context "with audio only" do
        before { `bundle exec ruby -Ilib bin/ffsplitter 'spec/fixtures/test video.mp4' -e .aac -o tmp 2>&1` }
        let(:file_list) { Dir.glob("tmp/*")  }
        it "creates files" do
          expect(file_list).to include("tmp/01 Chapter 1.aac")
          expect(file_list).to include("tmp/02 - Chapter 2.aac")
          expect(file_list).to include("tmp/03 Chapter 3.aac")
        end
      end
      after { FileUtils.rm(file_list) }
    end
  end
end

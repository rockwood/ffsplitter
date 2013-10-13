require 'spec_helper'

module FFSplitter
  describe "End to end" do
    before { Dir.mkdir("spec/tmp") unless Dir.exist?("spec/tmp") }

    describe "split" do
      before { `bundle exec ruby -Ilib bin/ffsplitter spec/fixtures/test.mp4 spec/tmp/` }
      let(:file_list) { Dir.glob("spec/tmp/*")  }
      it "creates 4 files" do
        expect(file_list).to include("spec/tmp/01 Chapter 1.mp4")
        expect(file_list).to include("spec/tmp/02 - Chapter 2.mp4")
        expect(file_list).to include("spec/tmp/03 Chapter 3.mp4")
      end
    end

    after { FileUtils.rm(file_list) }
  end
end
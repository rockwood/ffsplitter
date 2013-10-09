require 'spec_helper'

module FFSplitter
  describe Chapter do
    describe "filename" do
      let(:chapter){ Chapter.new(title: "   test title") }
      it "prettys up the chapter title" do
        expect(chapter.filename).to eq("test title")
      end
    end
  end
end
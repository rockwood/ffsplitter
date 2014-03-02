require 'spec_helper'

module FFSplitter
  describe ChapterList do
    describe "#add" do
      let(:chapter_list) { ChapterList.new }
      let!(:chapter1) { Chapter.new(title: "Chapter One") }
      let!(:chapter2) { Chapter.new(title: "Chapter Two") }
      before do
        chapter_list.add(chapter1)
        chapter_list.add(chapter2)
      end
      it "adds chapters to its collection" do
        expect(chapter_list.count).to eq(2)
        expect(chapter_list).to include(chapter1)
        expect(chapter_list).to include(chapter2)
      end
      it "sets the chapter's list" do
        expect(chapter1.list).to eq(chapter_list)
      end
    end
  end
end

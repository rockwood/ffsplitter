module FFSplitter
  class ChapterList

    include Enumerable

    def initialize
      @chapters = []
    end

    def each(&block)
      @chapters.each { |c| yield c }
    end

    def add(chapter)
      chapter.list = self
      @chapters << chapter
    end
  end
end

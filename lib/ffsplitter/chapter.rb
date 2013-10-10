require 'virtus'

module FFSplitter
  class ChapterList

    include Enumerable

    def initialize
      @chapters = []
    end

    def self.from_metadata(metadata)
      list = new
      metadata.each { |c| list.add(c) }
      list
    end

    def each(&block)
      @chapters.each { |c| yield c }
    end

    def add(attrs)
      chapter = Chapter.new(attrs)
      @chapters << chapter
      chapter.index = find_index(chapter)
      chapter
    end
  end

  class Chapter
    include Virtus.model

    attribute :start_frames, Integer, default: 0
    attribute :end_frames, Integer, default: 0
    attribute :index, Integer, default: 0
    attribute :timebase, Float, default: 1/30000
    attribute :title, String

    def start_time
      timebase * start_frames
    end

    def end_time
      timebase * end_frames
    end

    def filename
      "#{track} #{title.lstrip}"
    end

    def track
      (index + 1).to_s.rjust(2, '0')
    end
  end
end
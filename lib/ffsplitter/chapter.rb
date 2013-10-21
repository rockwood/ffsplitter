require 'virtus'

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

  class Chapter
    include Virtus.model

    attribute :start_frames, Integer, default: 0
    attribute :end_frames, Integer, default: 0
    attribute :timebase, Float, default: 1/30000
    attribute :title, String

    attr_accessor :list

    def start_time
      timebase * start_frames
    end

    def end_time
      timebase * end_frames
    end

    def filename
      "#{track} #{title.gsub(/[';:\\]/, '').lstrip}"
    end

    def index
      return 0 if list.nil?
      list.find_index(self)
    end

    def track
      (index + 1).to_s.rjust(2, '0')
    end
  end
end
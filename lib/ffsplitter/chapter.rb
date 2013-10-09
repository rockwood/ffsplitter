require 'virtus'

module FFSplitter
  class ChapterCollection

    attr_reader :chapters

    def initialize
      @chapters = []
    end

    def add(chapter)
      chapter.index = @chapters.size
      @chapters << chapter
      self
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
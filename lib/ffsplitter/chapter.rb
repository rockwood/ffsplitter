require 'virtus'

module FFSplitter
  class Chapter
    include Virtus.model

    attribute :start_frames, Integer, default: 0
    attribute :end_frames, Integer, default: 0
    attribute :timebase, Float, default: 1/30000
    attribute :title, String

    def start_time
      timebase * start_frames
    end

    def end_time
      timebase * end_frames
    end

    def filename
      title.lstrip
    end
  end
end
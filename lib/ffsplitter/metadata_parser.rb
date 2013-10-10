module FFSplitter
  class MetadataParser
    Chapter = Struct.new(:start_frames, :end_frames, :title, :timebase)

    def self.parse_chapters(metadata)
      chapters = []
      chapter = nil

      metadata.split("\n").each do |line|
        if line =~ /CHAPTER/
          chapter = Chapter.new
        end

        if line =~ /TIMEBASE=(\d+)\/(\d+)/
          chapter.timebase = $1.to_f / $2.to_f
        end

        if line =~ /START=(\d+)/
          chapter.start_frames = $1
        end

        if line =~ /END=(\d+)/
          chapter.end_frames = $1
        end

        if chapter && line =~ /title=(.*)/
          chapter.title = $1
          chapters << chapter
        end
      end

      chapters
    end
  end
end
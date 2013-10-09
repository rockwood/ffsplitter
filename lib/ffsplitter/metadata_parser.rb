module FFSplitter
  class MetadataParser
    def self.parse_chapters(metadata)
      chapters = ChapterCollection.new
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
          chapters.add(chapter)
        end
      end

      chapters
    end
  end
end
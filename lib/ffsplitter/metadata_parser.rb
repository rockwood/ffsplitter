module FFSplitter
  class MetadataParser
    Chapter = Struct.new(:start, :end, :title)

    def self.parse_chapters(metadata)
      chapters = []
      chapter = nil

      metadata.split("\n").each do |line|
        if line =~ /CHAPTER/
          chapter = Chapter.new
        end

        if line =~ /START=(\d+)/
          chapter.start = $1.to_i
        end

        if line =~ /END=(\d+)/
          chapter.end = $1.to_i
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
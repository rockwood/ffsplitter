module FFSplitter
  class Splitter
    def self.split_via_ffmpeg(filename)
      split(FFMpeg.new(filename))
    end

    def self.split(codec)
      chapter_list = MetadataParser.parse(codec.read_metadata)
      codec.encode(chapter_list)
    end
  end
end
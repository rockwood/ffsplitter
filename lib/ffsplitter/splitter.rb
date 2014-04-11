module FFSplitter
  class Splitter
    def self.split_via_ffmpeg(options)
      split(FFMpeg.new(options))
    end

    def self.split(codec)
      metadata = codec.read_metadata
      chapter_list = MetadataParser.parse(metadata)
      codec.encode(chapter_list)
    end
  end
end

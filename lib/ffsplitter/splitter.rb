module FFSplitter
  class Splitter
    def self.split_via_ffmpeg(filename, output_directory)
      split(FFMpeg.new(filename, output_directory))
    end

    def self.split(codec)
      metadata = codec.read_metadata
      chapter_list = MetadataParser.parse(metadata)
      codec.encode(chapter_list)
    end
  end
end
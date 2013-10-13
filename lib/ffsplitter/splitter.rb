module FFSplitter
  class Splitter
    def self.split_via_ffmpeg(filename, output_directory)
      split(FFMpeg.new(filename, output_directory))
    end

    def self.split(codec)
      chapter_list = MetadataParser.parse(codec.read_metadata)
      codec.encode(chapter_list)
    end
  end
end
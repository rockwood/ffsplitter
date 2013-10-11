require "ffsplitter/version"
require "ffsplitter/metadata_parser"
require "ffsplitter/chapter"
require "ffsplitter/command_runner"
require "ffsplitter/ffmpeg"

module FFSplitter
  class Splitter
    def self.split_via_ffmpeg(filename)
      split(filename, FFMpeg.new(filename))
    end

    def self.split(filename, codec)
      chapter_list = MetadataParser.parse(codec.read_metadata)
      codec.encode(chapter_list)
    end
  end

  class CLI
    def self.run(argv = ARGV)
      new(argv).run
    end

    def initialize(argv)
      @argv = argv
    end

    def run
      if @argv.empty?
        puts "WTF mate?"
        exit(1)
      else
        Splitter.split_via_ffmpeg(@argv[0])
      end
    end
  end
end

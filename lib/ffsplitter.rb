require "ffsplitter/version"
require "ffsplitter/metadata_parser"
require "ffsplitter/chapter"
require "ffsplitter/command_runner"
require "ffsplitter/encoder"

module FFSplitter
  class Splitter
    def self.split!(filename)
      chapter_collection = MetadataParser.parse_chapters(read_metadata(filename))
      Encoder.new(filename).encode(chapter_collection.chapters)
    end

    def self.read_metadata(filename)
      CommandRunner.run("ffmpeg -i #{filename} -v quiet -f ffmetadata -")
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
        Splitter.split!(@argv[0])
      end
    end
  end
end

require "ffsplitter/version"
require "ffsplitter/metadata_parser"

module FFSplitter
  class Splitter
    def self.split!(filename)
      puts MetadataParser.new(read_metadata(filename)).parse
    end

    def self.read_metadata(filename)
      `ffmpeg -i #{filename} -v quiet -f ffmetadata -`
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

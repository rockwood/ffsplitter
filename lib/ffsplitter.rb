require "ffsplitter/version"
require "ffsplitter/metadata_parser"
require "ffsplitter/chapter"
require "ffsplitter/chapter_list"
require "ffsplitter/command_runner"
require "ffsplitter/ffmpeg"
require "ffsplitter/splitter"

module FFSplitter
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
        Splitter.split_via_ffmpeg(@argv[0], @argv[1])
      end
    end
  end
end

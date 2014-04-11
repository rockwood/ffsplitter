require "ffsplitter/version"
require "ffsplitter/args_parser"
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
        options = ArgsParser.parse!(@argv)
        Splitter.split_via_ffmpeg(options)
      end
    end
  end
end

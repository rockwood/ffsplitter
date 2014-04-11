require 'optparse'
require 'ostruct'

class ArgsParser
  DEFAULT_OPTIONS = {
    audio_only: false
  }

  def self.parse!(args)
    options = OpenStruct.new(DEFAULT_OPTIONS)
    options.filename = args[0]

    parser = OptionParser.new do |opts|
      opts.banner = "Usage: ffsplitter test.mp4 [options]"

      opts.on("-e", "--output-extension EXTENSION", "Output extension") do |ext|
        options.output_extension = ext
      end

      opts.on("-o", "--output-path PATH", "Output path") do |dir|
        options.output_path = File.expand_path(dir)
      end
    end

    parser.parse!(args)
    options
  end
end

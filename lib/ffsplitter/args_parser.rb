require 'optparse'
require 'ostruct'

class ArgsParser
  DEFAULT_OPTIONS = {
    audio_extension: '.wav',
    video_extension: '.mp4',
  }

  def self.parse!(args)
    options = OpenStruct.new(DEFAULT_OPTIONS)
    options.filename = args[0]

    parser = OptionParser.new do |opts|
      opts.on("-a", "--audio EXTENSION", "Audio extension") do |extension|
        options.audio_extension = extension
      end

      opts.on("-v", "--video EXTENSION", "Video extension") do |extension|
        options.video_extension = extension
      end

      opts.on("-o", "--output PATH", "Output path") do |dir|
        options.output_path = File.expand_path(dir)
      end
    end

    parser.parse!(args)
    options
  end
end

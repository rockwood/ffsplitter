module FFSplitter
  class FFMpeg
    CODEC_OPTIONS= "-c copy -movflags faststart"
    attr_accessor :filename, :output_path, :runner

    def initialize(options)
      @filename = options[:filename]
      @output_path = options[:output_path]
      @runner = CommandRunner
    end

    def read_metadata
      runner.run("ffmpeg -i '#{filename}' -v quiet -f ffmetadata -")
    end

    def encode(chapters)
      commands = chapters.collect { |c| chapter_command(c) }
      runner.run("#{commands.join(' && ')}")
    end

    def chapter_command(chapter)
      output_file = File.expand_path(chapter.filename, output_path)
      "ffmpeg -ss #{chapter.start_time} -i '#{filename}' -t #{chapter.duration} #{CODEC_OPTIONS} '#{output_file}.mp4'"
    end
  end
end

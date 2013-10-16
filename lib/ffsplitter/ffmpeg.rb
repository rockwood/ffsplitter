module FFSplitter
  class FFMpeg
    attr_accessor :filename, :output_directory, :runner

    def initialize(filename, output_directory=nil)
      @filename = filename
      @output_directory = output_directory
      @runner = CommandRunner
    end

    def encode(chapters)
      commands = chapters.collect { |c| chapter_command(c) }
      runner.run("ffmpeg #{commands.join(" ")}")
    end

    def read_metadata
      runner.run("ffmpeg -i '#{filename}' -v quiet -f ffmetadata -")
    end

    def chapter_command(chapter)
      output_file = File.expand_path(chapter.filename, output_directory)
      "-i '#{filename}' -ss #{chapter.start_time} -to #{chapter.end_time} -c copy '#{output_file}.mp4'"
    end
  end
end
module FFSplitter
  class FFMpeg
    attr_accessor :filename, :output_directory, :runner

    def initialize(filename, output_directory="")
      @filename = filename
      @output_directory = output_directory
      @runner = CommandRunner
    end

    def encode(chapters)
      chapters.each do |chapter|
        runner.run(chapter_command(chapter))
      end
    end

    def read_metadata
      runner.run("ffmpeg -i #{filename} -v quiet -f ffmetadata -")
    end

    private

    def chapter_command(chapter)
      "ffmpeg -ss #{chapter.start_time} -i #{filename} -to #{chapter.end_time} -c copy '#{output_directory}#{chapter.filename}.mp4'"
    end
  end
end
module FFSplitter
  class FFMpeg
    def initialize(input_file, runner=CommandRunner)
      @input_file = input_file
      @runner = runner
    end

    def encode(chapters)
      chapters.each do |chapter|
        @runner.run(chapter_command(chapter))
      end
    end

    def read_metadata
      @runner.run("ffmpeg -i #{@input_file} -v quiet -f ffmetadata -")
    end

    private

    def chapter_command(chapter)
      "ffmpeg -i #{@input_file} -ss #{chapter.start_time} -to #{chapter.end_time} -c copy '#{chapter.filename}.mp4'"
    end
  end
end
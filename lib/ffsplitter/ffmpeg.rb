module FFSplitter
  class FFMpeg
    attr_accessor :filename, :runner

    def initialize(filename)
      self.filename = filename
      self.runner = CommandRunner
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
      "ffmpeg -ss #{chapter.start_time} -i #{filename} -to #{chapter.end_time} -c copy '#{chapter.filename}.mp4'"
    end
  end
end
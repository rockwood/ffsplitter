module FFSplitter
  class Encoder
    def initialize(input_file, options={})
      @input_file = input_file
      @runner = options[:runner] || CommandRunner
    end

    def encode(chapters)
      chapters.each do |chapter|
        @runner.run(chapter_command(chapter))
      end
    end

    private

    def chapter_command(chapter)
      "ffmpeg -i #{@input_file} -ss #{chapter.start_time} -to #{chapter.end_time} -c copy '#{chapter.filename}.mp4'"
    end
  end
end
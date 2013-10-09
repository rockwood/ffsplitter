module FFSplitter
  class Chapter
    attr_accessor :start_time, :end_time, :title, :timebase

    def initialize(options={})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def filename
      "#{@title}"
    end
  end
end
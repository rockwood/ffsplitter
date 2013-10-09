module FFSplitter
  class CommandRunner
    def self.run(command)
      `#{command}`
    end
  end
end
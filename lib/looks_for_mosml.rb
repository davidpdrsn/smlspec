class CommandLine
  def self.run_command(command)
    system(command)
  end
end

class LooksForMosml
  def self.installed?
    CommandLine.run_command("which mosml > /dev/null")
  end
end


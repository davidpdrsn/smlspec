class TestOutput
  attr_reader :message

  def initialize(lines)
    @lines = lines

    if compile_error?
      @message = lines.join("\n")
    end
  end

  def compile_error?
    @lines.any? { |line| /^!/ =~ line }
  end

  def tests
    @lines.inject([]) do |acc, line|
      acc << if /true/ =~ line
        Test.new(true, line.match(/(.+) true/)[1])
      else
        Test.new(false, line.match(/(.+) false/)[1])
      end
    end
  end
end

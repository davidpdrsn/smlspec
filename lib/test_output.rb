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
        TestOutput::Test.new(true, line.match(/(.+) true/)[1])
      else
        TestOutput::Test.new(false, line.match(/(.+) false/)[1])
      end
    end
  end
end

class TestOutput::Test
  attr_reader :status, :name

  def initialize(status, name)
    @status = status
    @name = name
  end

  def passed?
    @status
  end

  def ==(another_test)
    fields_used_for_comparison.inject(true) do |acc, m|
      acc && instance_variable_get("@#{m}") == another_test.send(m)
    end
  end

  private

  def fields_used_for_comparison
    [:status, :name]
  end
end

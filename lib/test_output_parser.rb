class TestOutputParser
  def self.parse(input)
    parser = self.new(input)

    if input.match(/!/)
      parser.parse_error
    else
      parser.parse
    end
  end

  def initialize(input)
    @input = input
  end

  def parse
    [
      dots_or_fs,
      blank_lines(3),
      failed_tests,
      blank_lines(2),
      "#{total} tests ran, #{failures} failure, #{passed} pass",
      blank_lines(2),
    ].flatten.join("\n")
  end

  def parse_error
    [
      "Unable to run tests, SML says:".red,
      "",
      "",
      @input,
    ].join("\n")
  end

  private

  def blank_lines(n)
    Array.new(n, "")
  end

  def dots_or_fs
    @input.split("\n").inject("") do |acc, s|
      if s.include?("true")
        acc += ".".green
      else
        acc += "F".red
      end
    end
  end

  def failed_tests
    @input.split("\n").select do |s|
      s.include?("false")
    end.inject("") do |acc, s|
      s.gsub(" false", "").red
    end
  end

  def total
    @input.split("\n").count
  end

  def failures
    @input.split("\n").select do |s|
      s.include?("false")
    end.count
  end

  def passed
    @input.split("\n").select do |s|
      s.include?("true")
    end.count
  end
end

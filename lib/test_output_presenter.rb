class TestOutputPresenter
  def self.parse(test_results)
    parser = self.new(test_results)

    if test_results.compile_error?
      parser.parse_error
    else
      parser.parse
    end
  end

  def initialize(test_results)
    @test_results = test_results
    @tests = test_results.tests unless @test_results.compile_error?
  end

  def parse
    output = ""

    output += dots_or_fs + "\n"
    if failures.count > 0
      output += blank_lines(3) + "\n"
      output += failed_tests + "\n"
    end
    output += blank_lines(2) + "\n"
    output += "#{@tests.count} tests ran, #{failures.count} red, #{passed.count} green"
    output += blank_lines(3)

    output
  end

  def parse_error
    [
      "Unable to run tests, SML says:".red,
      "",
      "",
      @test_results.message,
    ].join("\n")
  end

  private

  def blank_lines(n)
    Array.new(n, "").join("\n")
  end

  def dots_or_fs
    @tests.inject("") do |acc, test|
      if test.passed?
        acc += ".".green
      else
        acc += "F".red
      end
    end
  end

  def failed_tests
    failures.map { |t| t.name.red }.join("\n")
  end

  def failures
    @tests.reject(&:passed?)
  end

  def passed
    @tests.select(&:passed?)
  end
end

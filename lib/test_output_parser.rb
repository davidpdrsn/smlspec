class TestOutputParser
  def self.parse(test_results)
    parser = self.new(test_results)

    parser.parse
  end

  def initialize(test_results)
    @test_results = test_results
  end

  def parse
    output = ""

    output += dots_or_fs + "\n"
    if failures.count > 0
      output += blank_lines(3) + "\n"
      output += failed_tests + "\n"
    end
    output += blank_lines(2) + "\n"
    output += "#{@test_results.count} tests ran, #{failures.count} red, #{passed.count} green"
    output += blank_lines(3)

    output
  end

  def parse_error
    [
      "Unable to run tests, SML says:".red,
      "",
      "",
      @test_results,
    ].join("\n")
  end

  private

  def blank_lines(n)
    Array.new(n, "").join("\n")
  end

  def dots_or_fs
    @test_results.inject("") do |acc, test|
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
    @test_results.reject(&:passed?)
  end

  def passed
    @test_results.select(&:passed?)
  end
end

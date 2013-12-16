class TestFinder
  def is_test?(test)
    test.match(/_test/)
  end

  def find_tests(lines)
    lines.select {|line| is_test?(line) }
  end
end

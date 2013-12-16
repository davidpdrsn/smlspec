class TestFormatter
  def name(test)
    test.match(/val (.*?) =/)[1]
  end

  def condition(test)
    test.match(/val .*? = (.*?)$/)[1]
  end

  def format(test)
    "val #{name(test)} = test \"#{name(test)}\" (#{condition(test)})"
  end
end

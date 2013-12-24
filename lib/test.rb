class Test
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

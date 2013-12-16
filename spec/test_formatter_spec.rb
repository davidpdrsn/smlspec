require 'spec_helper'
require 'test_formatter'

describe TestFormatter do
  let(:test) { "val foo_test1 = 3 = 3" }
  let(:formatter) { TestFormatter.new }

  it "finds the name of a test" do
    formatter.name(test).should eq "foo_test1"
  end

  it "finds the condition" do
    formatter.condition(test).should eq "3 = 3"
  end

  it "formats a test" do
    formatted_test = formatter.format(test)

    formatted_test.should eq "val foo_test1 = test \"foo_test1\" (3 = 3)"
  end
end

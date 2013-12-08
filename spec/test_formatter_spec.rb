require 'spec_helper'
require 'test_formatter'

describe TestFormatter do
  it "formats a test" do
    formatter = TestFormatter.new
    test = "val foo_test1 = 3 = 3"
    formatted_test = formatter.format(test)

    formatted_test.should eq "val foo_test1 = test \"foo_test1\" (3 = 3)"
  end
end

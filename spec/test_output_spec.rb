require 'spec_helper'
require 'test_output'

describe TestOutput do
  it "parses output from tests" do
    lines = [
      "foo_test1 true",
      "foo_test2 false",
    ]
    output = TestOutput.new(lines)

    output.compile_error?.should be_false
    output.tests.should eq [
      TestOutput::Test.new(true, "foo_test1"),
      TestOutput::Test.new(false, "foo_test2"),
    ]
  end

  it "parses output from a compile error" do
    failure_message = [
      'File "foo.sml", line 1, characters 0-3:',
      '! foo',
      '! ^^^',
      '! Syntax error.',
    ]

    output = TestOutput.new(failure_message)

    output.compile_error?.should be_true
    output.message.should eq failure_message.join("\n")
  end
end

describe TestOutput::Test do
  it "can be passed" do
    TestOutput::Test.new(true, "").should be_passed
  end

  it "can be failed" do
    TestOutput::Test.new(false, "").should_not be_passed
  end

  it "has a name" do
    TestOutput::Test.new(false, "foo_test1").name.should eq "foo_test1"
  end
end

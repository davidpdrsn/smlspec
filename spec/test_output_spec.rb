require 'spec_helper'
require 'test_output'

class Test; end

describe TestOutput do
  before do
    Test.stub(:new) { double(:test) }
  end

  let(:lines) do
    ["foo_test1 true",
     "foo_test2 false"]
  end

  let(:failure_message) do
    ['File "foo.sml", line 1, characters 0-3:',
     '! foo',
     '! ^^^',
     '! Syntax error.']
  end

  it "parses output from tests" do
    Test.should_receive(:new).with(true, "foo_test1")
    Test.should_receive(:new).with(false, "foo_test2")

    output = TestOutput.new(lines)

    output.compile_error?.should be_false
    output.should have(2).tests
  end

  it "parses output from a compile error" do
    output = TestOutput.new(failure_message)

    output.compile_error?.should be_true
    output.message.should eq failure_message.join("\n")
  end
end

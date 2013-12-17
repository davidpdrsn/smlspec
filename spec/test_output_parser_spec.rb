require 'spec_helper'
require 'test_output_parser'
require 'colorize'

describe TestOutputParser do
  it "parses output for passed tests" do
    output = [
      "foo_test1 true",
      "foo_test2 false",
    ].join("\n")

    parsed_output = [
      ".".green + "F".red,
      "",
      "",
      "",
      "foo_test2".red,
      "",
      "",
      "2 tests ran, 1 failure, 1 pass",
      "",
      "",
    ].join("\n")

    TestOutputParser.parse(output).should eq parsed_output
  end

  it "parses output from a failure" do
    output = [
      'File "foo.sml", line 1, characters 0-3:',
      '! foo',
      '! ^^^',
      '! Syntax error.',
    ].join("\n")

    parsed_output = [
      "Unable to run tests, SML says:".red,
      "",
      "",
      'File "foo.sml", line 1, characters 0-3:',
      '! foo',
      '! ^^^',
      '! Syntax error.',
    ].join("\n")

    TestOutputParser.parse(output).should eq parsed_output
  end
end

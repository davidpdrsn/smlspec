require 'spec_helper'
require 'test_output_parser'
require 'colorize'

describe TestOutputParser do
  it "parses output for passed tests" do
    output = double(:test_output, compile_error?: false, tests: [
      double(:test, passed?: true, name: "foo_test1"),
      double(:test, passed?: false, name: "foo_test2"),
    ])

    parsed_output = [
      ".".green + "F".red,
      "",
      "",
      "",
      "foo_test2".red,
      "",
      "",
      "2 tests ran, 1 red, 1 green",
      "",
      "",
    ].join("\n")

    TestOutputParser.parse(output).should eq parsed_output
  end

  it "parses output with only passes" do
    output = double(:test_output, compile_error?: false, tests: [
      double(:test, passed?: true, name: "foo_test1"),
      double(:test, passed?: true, name: "foo_test2"),
    ])

    parsed_output = [
      ".".green+".".green,
      "",
      "",
      "2 tests ran, 0 red, 2 green",
      "",
      "",
    ].join("\n")

    TestOutputParser.parse(output).should eq parsed_output
  end

  it "parses output from a failure" do
    failure_message = [
      'File "foo.sml", line 1, characters 0-3:',
      '! foo',
      '! ^^^',
      '! Syntax error.',
    ].join("\n")

    output = double(:test_output, compile_error?: true, message: failure_message)

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

require 'spec_helper'
require 'formats_lines'

describe FormatsLines do
  it "formats lines" do
    unformatted = fixture("unformatted.sml")
    formatted = fixture("formatted.sml")

    FormatsLines.format(unformatted).should eq formatted
  end

  it "doesn't die when given one that that should be joined" do
    FormatsLines.format("foo _  = 3").should eq "foo _  = 3"
  end

  it "removes comments" do
    formatter = FormatsLines.new(fixture("with_comments.sml"))
    fixed = fixture("without_comments.sml")

    formatter.remove_comments!

    formatter.lines.should eq fixed
  end

  it "remove leading whitespace where necessary" do
    formatter = FormatsLines.new(fixture("with_whitespace.sml"))
    fixed = fixture("without_whitespace.sml")

    formatter.remove_leading_whitespace!

    formatter.lines.should eq fixed
  end

  it "joins lines that have been broken" do
    formatter = FormatsLines.new(fixture("broken_lines.sml"))
    fixed = fixture("joined_lines.sml")

    formatter.join_broken_lines!

    formatter.lines.should eq fixed
  end
end

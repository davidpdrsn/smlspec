require 'spec_helper'
require 'formats_tests'

describe FormatsTests do
  it "formats tests" do
    unformatted = fixture("unformatted_tests.sml")
    formatted = fixture("formatted_tests.sml")

    FormatsTests.format(unformatted).should eq formatted
  end
end

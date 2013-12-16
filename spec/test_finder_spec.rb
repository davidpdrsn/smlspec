require 'spec_helper'
require 'test_finder'

describe TestFinder do
  let(:test_finder) { TestFinder.new }
  let(:test) { "val foo_test1 = 3 = 3" }
  let(:non_test) { "fun foo _ = 3" }

  it "knows that a test is test" do
    test_finder.is_test?(test).should be_true
  end

  it "knows that a non-test is not a test" do
    test_finder.is_test?(non_test).should be_false
  end

  it "finds tests" do
    lines = [
      non_test,
      test,
      test,
      non_test,
      test,
      non_test
    ]

    test_finder.find_tests(lines).should eq [
      test,
      test,
      test
    ]
  end
end

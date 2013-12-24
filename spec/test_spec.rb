require 'spec_helper'
require 'test'

describe Test do
  it "can be passed" do
    Test.new(true, "").should be_passed
  end

  it "can be failed" do
    Test.new(false, "").should_not be_passed
  end

  it "has a name" do
    Test.new(false, "foo_test1").name.should eq "foo_test1"
  end

  it "has a status" do
    Test.new(false, "foo_test1").status.should eq false
  end
end

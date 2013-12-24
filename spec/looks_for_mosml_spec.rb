require 'spec_helper'
require 'looks_for_mosml'

describe LooksForMosml do
  it "knows when mosml is not installed" do
    CommandLine.should_receive(:run_command).with("which mosml > /dev/null").
      and_return(true)

    LooksForMosml.installed?.should be_true
  end

  it "knows when mosml is not installed" do
    CommandLine.should_receive(:run_command).with("which mosml > /dev/null").
      and_return(false)

    LooksForMosml.installed?.should be_false
  end
end

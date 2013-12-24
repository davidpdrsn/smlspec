require 'spec_helper'
require 'sml_file'

describe SmlFile do
  before(:each) { clean_tmp }
  after(:each)  { clean_tmp }

  let(:file) do
    SmlFile.new("spec/fixtures/unformatted_tests.sml",
                formatters: [double(format: ""), double(format: "")])
  end

  it "checks that the formatters have a format method" do
    expect do
      SmlFile.new("spec/fixtures/unformatted_tests.sml",
                  formatters: [Class.new]
                 )
    end.to raise_error SmlFile::InvalidFormatterInterface
  end

  describe "#save_as!" do
    before { file.save_as!("tmp/saved_as.sml") }

    it "saves the file to the specified folder" do
      File.read("tmp/saved_as.sml").should eq file.contents
    end

    it "updates the path" do
      file.path.should eq "tmp/saved_as.sml"
    end
  end

  describe "#prepare_tests" do
    it "prepares the tests" do
      formatter = double(format: fixture("formatted_tests.sml"))
      file = SmlFile.new("spec/fixtures/unformatted_tests.sml",
                         formatters: [formatter])

      formatter.should_receive(:format)
      file_with_tests_prepared = file.prepare_tests

      file_with_tests_prepared.contents.should eq fixture("formatted_tests.sml")
    end
  end

  describe "#compile!" do
    it "compiles the file into the specified destination" do
      file = SmlFile.new("spec/fixtures/simple.sml")
      file.compile!("tmp/foo.exe")

      File.exists?("tmp/foo.exe").should be_true
    end

    it "throws an exception with the compile error if it doesn't compile" do
      file = SmlFile.new("spec/fixtures/formatted.sml")

      expect do
        file.compile!("tmp/foo.exe")
      end.to raise_error(SmlFile::CannotCompile, /File "spec\/fixtures\/formatted\.sml"/)
    end

    it "doens't compile files that haven't been saved to disk" do
      file_with_tests_prepared = file.prepare_tests

      expect do
        file_with_tests_prepared.compile!("tmp/foo.exe")
      end.to raise_error SmlFile::NotSaved
    end
  end

  describe "#run" do
    let(:file) { SmlFile.new("spec/fixtures/simple.sml") }

    it "returns the output of running the file" do
      file.compile!("tmp/foo.exe")

      file.run.should eq "foo"
    end

    it "doesn't run without first having been compiled" do
      expect do
        file.run
      end.to raise_error SmlFile::NotCompiled
    end
  end

  describe "#delete!" do
    it "deletes the file" do
      File.write("tmp/tmp.sml", "")
      f = SmlFile.new("tmp/tmp.sml")

      expect do
        f.delete!
      end.to change { File.exists?("tmp/tmp.sml") }
      f.path.should be_nil
    end
  end
end

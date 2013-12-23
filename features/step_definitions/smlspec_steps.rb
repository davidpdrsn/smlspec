Given(/^I have written an SML file with tests$/) do
  File.open("tmp/integration_file.sml", "w") do |f|
    f.puts "fun f _ = 3"
    f.puts "val f_test1 = f 3 = 3"
    f.puts "val f_test2 = f 5 = 3"
    f.puts "val f_test3 = f 3 = 5"
  end
end

When(/^I run smlspec on the file$/) do
  @output = `./bin/smlspec tmp/integration_file.sml`
end

Then(/^I should see the test output$/) do
  lines = [
    ".".green + ".".green + "F".red,
    "",
    "",
    "",
    "f_test3".red,
    "",
    "",
    "3 tests ran, 1 red, 2 green",
    "",
    "",
  ].join("\n")

  lines.should eq @output
end


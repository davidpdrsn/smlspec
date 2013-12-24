require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

desc 'Build gem'
task :build do
  guard_against_broken_tests

  system "gem build smlspec.gemspec"
  Dir.glob("*.gem") {|f| system "mv #{f} build" }
end

desc 'Install gem'
task :install do
  guard_against_broken_tests

  system "gem uninstall smlspec"
  newest_build = Dir.glob("build/*.gem").last
  system "gem install ./#{newest_build}"
end

desc 'Push to rubygems'
task :push do
  guard_against_broken_tests

  newest_build = Dir.glob("build/*.gem").last
  system "gem push ./#{newest_build}"
end

desc 'Run all tests and tell if there are failures'
task :test_all do
  if tests_passing?
    puts "OK!"
  else
    puts "Errors!"
  end
end

def tests_passing?
  system("rake > /dev/null") && system("cucumber > /dev/null")
end

def guard_against_broken_tests
  unless tests_passing?
    puts "Can't do that with broken tests"
    exit 1
  end
end


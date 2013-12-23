require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

desc 'Build gem'
task :build do
  system "gem build smlspec.gemspec"
  Dir.glob("*.gem") {|f| system "mv #{f} build" }
end

desc 'Install gem'
task :install do
  system "gem uninstall smlspec"
  newest_build = Dir.glob("build/*.gem").last
  system "gem install ./#{newest_build}"
end

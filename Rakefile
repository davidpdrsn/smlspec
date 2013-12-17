require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

task :build do
  system "gem build smlspec.gemspec"
  Dir.glob("*.gem") {|f| system "mv #{f} build" }
end

task :install do
  system "gem uninstall smlspec"
  newest_build = Dir.glob("build/*.gem").last
  system "gem install ./#{newest_build}"
end

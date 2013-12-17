Gem::Specification.new do |s|
  s.name        = 'smlspec'
  s.version     = '0.0.3'
  s.date        = '2012-12-16'
  s.summary     = "Runner for SML tests"
  s.description = "Gem for running tests in SML files"
  s.authors     = ["David Pedersene"]
  s.email       = 'david.pdrsn@gmail.com'
  s.homepage    = 'http://github.com/davidpdrsn/smlspec'
  s.license     = 'MIT'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'colorize'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*_spec.rb`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

Gem::Specification.new do |s|
  s.name        = 'smlspec'
  s.version     = '0.0.1'
  # s.executables << 'smlspec'
  s.date        = '2012-12-16'
  s.summary     = "Runner for SML tests"
  s.description = "Gem for running tests in SML files"
  s.authors     = ["David Pedersene"]
  s.email       = 'david.pdrsn@gmail.com'
  s.files       = ["lib/formats_lines.rb", "formats_tests.rb"]
  s.homepage    = 'http://github.com/davidpdrsn/smlspec'
  s.license     = 'MIT'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end

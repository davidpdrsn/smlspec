require 'pp'
require_relative 'support/helper_methods'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'
end

def fixture(fixture_name)
  File.read("spec/fixtures/#{fixture_name}").chomp
end


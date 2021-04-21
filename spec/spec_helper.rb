require 'vcr'
require 'byebug'

RSpec.configure do |config|
  config.color = true
end

RSPEC_ROOT = File.dirname __FILE__

VCR.configure do |config|
  config.cassette_library_dir = "#{RSPEC_ROOT}/fixtures/vcr_cassettes"
  config.hook_into :webmock

  config.configure_rspec_metadata!
  config.default_cassette_options = { record: :new_episodes }
  config.before_record { |i| i.response.body.force_encoding('UTF-8') }
end
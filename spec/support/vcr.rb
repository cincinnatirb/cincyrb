require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.configure_rspec_metadata!
  c.debug_logger = File.open('log/vcr.log', 'w')
  c.hook_into :webmock
  c.ignore_hosts 'chromedriver.storage.googleapis.com'
  c.ignore_localhost = true
end

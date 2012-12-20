require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :fakeweb
  c.filter_sensitive_data('<API KEY>') { ENV.fetch('MEETUP_API_KEY') }
end

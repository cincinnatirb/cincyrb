require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock

  c.ignore_localhost = true
  c.ignore_hosts 'chromedriver.storage.googleapis.com'

  # Configure VCR to allow connections when no cassette is present in CI
  # This will allow the tests to run in GitHub Actions without Bluesky credentials
  c.allow_http_connections_when_no_cassette = true if ENV['CI'] == 'true'

  # Configure VCR to ignore Bluesky API requests
  c.ignore_request do |request|
    URI(request.uri).host == 'bsky.social'
  end

  # Configure VCR to use the correct record mode in CI
  c.default_cassette_options = {
    record: ENV['VCR_RECORD_MODE']&.to_sym || :once
  }
end

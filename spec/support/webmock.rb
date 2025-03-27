require "webmock/rspec"

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before do
    stub_request(:get, "https://bsky.social/xrpc/com.atproto.identity.resolveHandle?handle=cincyrb.com")
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Ruby'
        }
      )
      .to_return(status: 200, body: "", headers: {})

    stub_request(:post, "https://bsky.social/xrpc/com.atproto.server.createSession")
      .with(
        body: "{\"identifier\":\"#{Rails.application.credentials.dig(:bluesky, :username)}\",\"password\":\"#{Rails.application.credentials.dig(:bluesky, :app_password)}\"}",
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type' => 'application/json',
          'User-Agent' => 'Ruby'
        }
      )
      .to_return(status: 200, body: "", headers: {})
  end
end

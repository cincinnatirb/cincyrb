require "webmock/rspec"

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:post, "https://bsky.social/xrpc/com.atproto.server.createSession")
      .with(
        body: {identifier: nil, password: nil}.to_json,
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type'=>'application/json',
          'User-Agent'=>'Ruby'
        }
      )
      .to_return(status: 200, body: {accessJwt: "fake-jwt-token"}.to_json, headers: {})
  end
end

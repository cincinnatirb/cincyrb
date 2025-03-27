class BlueskyClient
  include HTTParty
  base_uri 'https://bsky.social/xrpc'
  format :json

  def initialize
    @access_jwt = nil
    authenticate
  end

  def resolve_handle(handle)
    response = self.class.get('/com.atproto.identity.resolveHandle', query: { handle: })
    response.success? ? response['did'] : nil
  end

  def get_author_feed(did, limit = 20)
    response = self.class.get('/app.bsky.feed.getAuthorFeed',
                              query: {
                                actor: did,
                                limit:
                              },
                              headers: auth_headers)
    response.success? ? response['feed'] : nil
  end

  private

  def authenticate
    response = create_session
    handle_authentication_response(response)
  end

  def create_session
    response = self.class.post('/com.atproto.server.createSession',
                               body: auth_credentials.to_json,
                               headers: { 'Content-Type' => 'application/json' })

    if response.success?
      response
    else
      handle_auth_error(response)
    end
  end

  def handle_authentication_response(response)
    if response.success?
      @access_jwt = response['accessJwt']
    else
      handle_auth_error(response)
    end
  end

  def handle_auth_error(response)
    Rails.logger.error "Failed to authenticate with Bluesky: #{response.body}"
    raise HTTParty::Error, "Authentication failed"
  end

  def auth_credentials
    {
      identifier: ENV['BLUESKY_USERNAME'] || Rails.application.credentials.dig(:bluesky, :username),
      password: ENV['BLUESKY_APP_PASSWORD'] || Rails.application.credentials.dig(:bluesky, :app_password)
    }
  end

  def auth_headers
    {
      'Authorization' => "Bearer #{@access_jwt}"
    }
  end
end

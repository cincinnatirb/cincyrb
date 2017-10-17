class TwitterController < ApplicationController
  def timeline
    # Exchange our oauth_token and oauth_token secret for the AccessToken instance.
    access_token = prepare_access_token("#{ENV.fetch('TWITTER_ACCESS_TOKEN')}", "#{ENV.fetch('TWITTER_ACCESS_TOKEN_SECRET')}")

    # use the access token as an agent to get the home timeline
    response = access_token.request(:get, "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=cincinnatirb&count=1")

    respond_to do |format|
      format.json  { render :json => response.body } # don't do msg.to_json
    end
  end

  # Exchange your oauth_token and oauth_token_secret for an AccessToken instance.
  private
  def prepare_access_token(oauth_token, oauth_token_secret)
    consumer = OAuth::Consumer.new("#{ENV.fetch('TWITTER_API_KEY')}", "#{ENV.fetch('TWITTER_API_SECRET')}", { :site => "https://api.twitter.com", :scheme => :header })

    # now create the access token object from passed values
    token_hash = { :oauth_token => oauth_token, :oauth_token_secret => oauth_token_secret }
    access_token = OAuth::AccessToken.from_hash(consumer, token_hash )

    return access_token
  end
end

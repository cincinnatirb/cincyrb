require 'spec_helper'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :fakeweb
end

describe TwitterController do

  describe "GET 'timeline'" do
    it "returns http success" do
      VCR.use_cassette("twitter", :match_requests_on => [:host, :path]) do
        get 'timeline', :format => :json
        response.should be_success
      end
    end
  end

end

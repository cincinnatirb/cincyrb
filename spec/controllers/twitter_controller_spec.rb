require 'spec_helper'

describe TwitterController do

  describe "GET 'timeline'" do
    it "returns http success" do
      get 'timeline'
      response.should be_success
    end
  end

end

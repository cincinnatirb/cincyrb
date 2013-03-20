require 'spec_helper'

describe PastEvent do

  describe ".recent" do
    it "should order most recent first" do
      march_meeting = FactoryGirl.create(:past_event, date: Date.new(2013, 3))
      feb_meeting   = FactoryGirl.create(:past_event, date: Date.new(2013,2))
      april_meeting = FactoryGirl.create(:past_event, date: Date.new(2013,4))

      PastEvent.recent.should == [april_meeting, march_meeting, feb_meeting]
    end
  end
end

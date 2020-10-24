require 'rails_helper'

describe PastEvent do
  describe ".recent" do
    it "should order most recent first" do
      march_meeting = create(:past_event, date: Date.new(2013, 3))
      feb_meeting   = create(:past_event, date: Date.new(2013, 2))
      april_meeting = create(:past_event, date: Date.new(2013, 4))

      expect(PastEvent.recent.first).to eq(april_meeting)
    end
  end
end

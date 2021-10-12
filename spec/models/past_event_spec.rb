require 'rails_helper'

describe PastEvent do
  describe ".recent" do
    it "orders most recent first" do
      create(:past_event, date: Date.new(2013, 3))
      create(:past_event, date: Date.new(2013, 2))
      april_meeting = create(:past_event, date: Date.new(2013, 4))

      expect(described_class.recent.first).to eq(april_meeting)
    end
  end
end

require 'rails_helper'

describe Meeting do

  context "limiting number of results" do
    before { allow(Meeting).to receive(:ruby_brigade_meetings).and_return([1,2,3,4]) }

    describe ".get_next_meeting" do
      it "should return the first upcoming event" do
        expect(Meeting.get_next_meeting).to eq(1)
      end
    end

    describe ".get_upcoming_meetings" do
      it "should return the next three events that follow the first upcoming event" do
        expect(Meeting.get_upcoming_meetings).to eq([2,3,4])
      end
    end
  end

  describe ".ruby_brigade_meetings" do
    it "should only return events named as Ruby Brigade" do
      VCR.use_cassette("meetup", match_requests_on: [:host, :path], record: :new_episodes) do
        events = Meeting.ruby_brigade_meetings.map { |meeting| meeting["name"] }
        expect(events.uniq).to eq(["Ruby Brigade"])
      end
    end
  end
end

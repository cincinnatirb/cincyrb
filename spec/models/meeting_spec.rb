require 'rails_helper'

RSpec.describe Meeting, type: :model do
  describe ".next_meeting" do
    before { allow(described_class).to receive(:ruby_brigade_meetings).and_return([1, 2, 3, 4]) }

    it "returns the first upcoming event" do
      expect(described_class.next_meeting).to eq(1)
    end
  end

  describe ".upcoming_meetings" do
    before { allow(described_class).to receive(:ruby_brigade_meetings).and_return([1, 2, 3, 4]) }

    it "returns the next three events that follow the first upcoming event" do
      expect(described_class.upcoming_meetings).to eq([2, 3, 4])
    end
  end

  describe ".ruby_brigade_meetings" do
    let!(:events) {
      VCR.use_cassette("meetup", match_requests_on: %i[host path], record: :new_episodes) do
        described_class.ruby_brigade_meetings.map { |meeting| meeting["name"] }
      end
    }

    it "only return events named as Ruby Brigade" do
      expect(events.uniq).to eq(["Ruby Brigade"])
    end
  end
end

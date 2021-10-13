require 'rails_helper'

describe PastEvent do
  it { is_expected.to have_many(:speaker_assignments) }
  it { is_expected.to have_many(:speakers).through(:speaker_assignments) }
  it { is_expected.to have_many(:videos).dependent(:destroy) }
  it { is_expected.to validate_presence_of(:date) }
  it { is_expected.to validate_presence_of(:topic) }

  describe ".recent" do
    it "orders most recent first" do
      create(:past_event, date: Date.new(2013, 3))
      create(:past_event, date: Date.new(2013, 2))
      april_meeting = create(:past_event, date: Date.new(2013, 4))

      expect(described_class.recent.first).to eq(april_meeting)
    end
  end
end

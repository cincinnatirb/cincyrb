require 'rails_helper'

RSpec.describe PastEvent, type: :model do
  context 'Associations & Validations' do # rubocop:disable RSpec/ContextWording
    before { build(:past_event) }

    it { is_expected.to have_many(:speaker_assignments).dependent(:destroy) }
    it { is_expected.to have_many(:speakers).through(:speaker_assignments) }
    it { is_expected.to have_many(:videos).dependent(:destroy) }
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:topic) }
  end

  describe ".recent" do
    it "orders most recent first" do
      create(:past_event, date: Date.new(2013, 3))
      create(:past_event, date: Date.new(2013, 2))
      april_meeting = create(:past_event, date: Date.new(2013, 4))

      expect(described_class.recent.first).to eq(april_meeting)
    end
  end

  describe '#speaker_names' do
    subject { past_event.speaker_names }

    let!(:past_event) { create(:past_event, :with_speakers, speaker_count: 2) }

    it { is_expected.to match("#{past_event.speakers.first.name}, #{past_event.speakers.last.name}") }
  end
end

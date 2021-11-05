require "rails_helper"

RSpec.describe "Past Events", type: :system do
  context 'when listing' do
    subject { page }

    let!(:past_event) { create(:past_event, :with_speakers, speaker_count: 2) }
    let!(:video) { create(:video, url: 'https://example.com/video/qwerty', past_event: past_event) }

    before do
      VCR.use_cassette('spec_system_past-events-spec', record: :new_episodes) do
        visit past_events_path
      end
    end

    it { is_expected.to have_text(past_event.topic) }
    it { is_expected.to have_selector('div.speakers') }
    it { is_expected.to have_text(past_event.speakers.first.name) }
    it { is_expected.to have_text(past_event.speakers.last.name) }
    it { is_expected.to have_selector('div.videos') }
    it { is_expected.to have_selector("iframe[src='#{video.url}']") }
  end
end

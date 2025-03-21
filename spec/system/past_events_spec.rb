require "rails_helper"

RSpec.describe "Past Events" do
  context 'when listing' do
    subject { page }

    let!(:past_event) { create(:past_event, :with_speakers, speaker_count: 2) }
    let!(:video) { create(:video, url: 'https://example.com/video/qwerty', past_event:) }

    before { visit past_events_path }

    it { is_expected.to have_text(past_event.topic) }

    it 'lists all event speakers' do
      expect(page.all('div.speaker').count).to eq(past_event.speakers.count)
    end

    it { is_expected.to have_text(past_event.speakers.first.name) }
    it { is_expected.to have_text(past_event.speakers.last.name) }
    it { is_expected.to have_css('div.past-event__video') }
    it { is_expected.to have_selector("iframe[src='#{video.url}']") }
  end
end

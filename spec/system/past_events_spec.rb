require "rails_helper"

RSpec.describe "Past Events", type: :system do
  let!(:speaker) { create(:speaker, name: 'Jim Weirich') }
  let!(:past_event) { create(:past_event, topic: 'A Really Cool Rails Feature', speakers: [speaker]) }
  let!(:video) { create(:video, url: 'https://example.com/video/qwerty', past_event: past_event) }

  context 'when visiting the Past Events page' do
    subject { page }

    before do
      VCR.use_cassette('spec_system_past-events-spec', record: :new_episodes) do
        visit past_events_path
      end
    end

    it { is_expected.to have_text(past_event.topic) }
    it { is_expected.to have_selector('div.speakers') }
    it { is_expected.to have_text(speaker.name) }
    it { is_expected.to have_selector('div.videos') }
    it { is_expected.to have_selector("iframe[src='#{video.url}']") }
  end
end
